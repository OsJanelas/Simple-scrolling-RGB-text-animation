#include "font.h"
#include "graphics.h"
#include "input.h"

// SINE TABLE
int sine_table[16] = {0, 4, 8, 11, 13, 14, 15, 14, 13, 11, 8, 4, 0, -4, -8, -11};

void _start() {
    const char* msg = "Hello World!";
    int scroll_x = WSCREEN;
    unsigned char base_color = 32;

    while (1) {
        ClearScreen();

        for (int i = 0; i < 12; i++) {
            int char_x = scroll_x + (i * 10);
            // WAVE EFFECT
            int y_offset = sine_table[(char_x / 8) % 16];
            int char_y = (HSCREEN / 2) + y_offset;

            // FONT
            for (int row = 0; row < 8; row++) {
                for (int col = 0; col < 8; col++) {
                    if ((font_mini[i * 8 + row] >> (7 - col)) & 1) {
                        PutPixel(char_x + col, char_y + row, base_color + i);
                    }
                }
            }
        }

        scroll_x--;
        if (scroll_x < -120) scroll_x = WSCREEN;
        
        base_color++;

        for (volatile int d = 0; d < 400000; d++);
    }
}