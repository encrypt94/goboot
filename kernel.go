package kernel

import "unsafe"

const (
	Black uint8 = iota
	Blue
	Green
	Cyan
	Red
	Pink
	Brown
	LightGray
	DarkGray
	LightBlue
	LightGreen
	LightCyan
	LightRed
	LightPink
	Yellow
	White
)

var videoram = (*[25][80][2]uint8)(unsafe.Pointer(uintptr(0xb8000)))

func clearScreen(c uint8) {
	for x := 0; x < 80; x++ {
		for y := 0; y < 25; y++ {
			videoram[y][x][0] = 0x20
			videoram[y][x][1] = 0x00 | c << 4
		}
	}
}

func Kmain() {
	clearScreen(LightBlue)
}
