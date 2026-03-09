void drawchar(BYTE* bitmap, DWORD color);
void print(const char* str, DWORD color);
void debug(const CHAR* str, int debug);
void intomsg(int value, char* buffer);
void printint(int value, DWORD color);
void printhex(int value, DWORD color);
void printout(char letter, DWORD color);

int atoi(const char* str);
int GetCursorX();
int GetCursorY();
void SetCursorX(int x);
void SetCursorY(int y);