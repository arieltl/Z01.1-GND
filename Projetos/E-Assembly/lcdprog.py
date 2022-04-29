import pygame
import numpy as np

from lcdprogf import main

G_HEIGHT, G_WIDTH = 240,320
HEIGHT, WIDTH  = 960, 1280

grid = np.zeros([G_HEIGHT,G_WIDTH])
saved_grid = np.zeros([G_HEIGHT,G_WIDTH])

pygame.init()
window = pygame.display.set_mode((WIDTH, HEIGHT))
grid_unit = HEIGHT / G_HEIGHT

square_size = int(0.9 * grid_unit)
inserting = True

v_mode = False
h_mode = False
x_fixed,y_fixed = 0,0
clock = pygame.time.Clock()
timer = 0
last_change_coord = None
game = True
def get_indexes(pos):
	return tuple(int(cord / grid_unit) for cord in pos)


def generate_assembly():
	l = []
	for row in range(240):
		for col in range(20):
			n = int("".join(reversed([str(x) for x in grid[row,col*16:(col*16)+16].astype(int)])),2)

			l+=[f'leaw ${n}, %A\n','movw %A, %D\n',f'leaw ${16384+(20*row)+col}, %A\n','movw %D, (%A)\n']
	with open('geralcd.nasm','w') as file:
		file.writelines(l)
	main()

			

	
while game:
	dt = clock.tick(120)
  

	window.fill((200,) * 3)
	for i in range(G_HEIGHT):
		center_y = i * grid_unit + grid_unit / 2
		square_y = int(center_y - square_size / 2)
		for j in range(G_WIDTH):
			center_x = j * grid_unit + grid_unit / 2
			square_x = int(center_x - square_size / 2)
			square = pygame.Rect((square_x, square_y),
								 (square_size, square_size))
			pygame.draw.rect(window, (255 * grid[i][j],) * 3, square)

	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			game = False
			print("x")
		elif event.type == pygame.MOUSEBUTTONDOWN and event.button == 1:
			x, y = get_indexes(event.pos)
			size = 3 if inserting else 3
			if v_mode:
				x_fixed = x
			elif h_mode:
				y_fixed = y
			left,right = max(x-size,0),min(x+size+1,G_WIDTH)
			top, bottom = max(y-size,0), min(y+size+1,G_HEIGHT)
			grid[top:bottom,left:right] = int(inserting)
		elif event.type == pygame.MOUSEMOTION and pygame.mouse.get_pressed()[0]:
			x, y = get_indexes(event.pos)
			if v_mode:
				x = x_fixed
			elif h_mode:
				y = y_fixed
			if last_change_coord != (x, y):
				size = 3 if inserting else 3
				left,right = max(x-size,0),min(x+size+1,G_WIDTH)
				top, bottom = max(y-size,0), min(y+size+1,G_HEIGHT)
				grid[top:bottom,left:right] = int(inserting)
				last_change_coord = (x, y)
		elif event.type == pygame.KEYDOWN:
			if event.key == pygame.K_r:
				grid = np.zeros([G_HEIGHT,G_WIDTH])
			elif event.key == pygame.K_SPACE:
				generate_assembly()
			elif event.key == pygame.K_s:
				saved_grid = grid.copy()
			elif event.key == pygame.K_l:
				grid = saved_grid.copy()
			elif event.key == pygame.K_i:
				inserting = not inserting
			elif event.key == pygame.K_v:
				v_mode = True
			elif event.key == pygame.K_h:
				h_mode = True
		elif event.type == pygame.KEYUP:
			if event.key == pygame.K_v:
				v_mode = False
			elif event.key == pygame.K_h:
				h_mode = False
				
	pygame.display.update()

pygame.quit()
