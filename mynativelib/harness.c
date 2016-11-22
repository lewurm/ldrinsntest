#include <stdlib.h>
#include <android/log.h>

void *ldrinsntest (int cmp1, int cmp2, void *mem);

#ifdef ANDROID
#define fdebug __android_log_print(ANDROID_LOG_DEBUG, "ldrinsn", 
#else
#define fdebug fprintf (stderr,
#endif

#define SIZE 0x100000
void harness (void)
{
	int i;
	void *backup [SIZE];
	for (i = 0; i < SIZE; i++) {
		char *mem = (char *) malloc (12);
		char *mem_new = (char *) ldrinsntest (12, 12, (void *) mem);
		if (mem != (mem_new - 8)) {
			fdebug "wtf: %p vs. %p (iteration=%x)\n", mem, mem_new, i);
			abort ();
			return;
		}
		if ((i % 0x40000) == 0) {
			fdebug "what is up? i=%x, mem=%p, mem_new=%p\n", i, mem, mem_new);
		}
		backup[i] = mem;
	}
	for (i = 0; i < SIZE; i++) {
		// free (backup[i]);
	}
}
