#ifndef DBG_H
#define DBG_H

#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <stdbool.h>

#ifdef NDEBUG
  #define debug(M, ...)
#else
  #define debug(M, ...) fprintf(stderr, "[DEBUG] %s:%d: " M "\n", __FILE__, \
    __LINE__, ##__VA_ARGS__)
#endif
  
#define check_debug(A, M, ...) if(!(A)) { debug(M, ##__VA_ARGS__); goto error; }

#define error(M, ...) fprintf(stderr, "[ERROR] %s:%d: " M "\n", __FILE__, \
  __LINE__, ##__VA_ARGS__)

#define check_error(A, M, ...) if(!(A)) { error(M, ##__VA_ARGS__); goto error; }

#define check_error_silent(A) if(!(A)) { goto error; }

#define test_failure(M, ...) fprintf(stderr, "== TEST FAILED == %s:%d: " M "\n", __FILE__, \
  __LINE__, ##__VA_ARGS__)

#define test(A, M, ...) if(!(A)) { test_failure(M, ##__VA_ARGS__); goto error; }

////////////////////////////////////////////////////////////
// Binary search
////////////////////////////////////////////////////////////
bool binsearch(int v, int* array, size_t sz);

////////////////////////////////////////////////////////////
// Linked list stack, for tracking function names 
//  (used to generate labels of the form functionName$labelName)
////////////////////////////////////////////////////////////
void llPush(const char* str);
void llPop();
const char* llPeek();
void llDelete();

#endif
