#include <stdio.h>
#include <stdlib.h>
#include "util.h"
#include "file.h"
#include "parser.h"

int main(int argc, char** argv){
  debug("Start");

  // Create asm file
  FileInfo_t fileInfo = {"", "", "", FILENAME_MAX};
  int ret = examineFile(argc, argv, &fileInfo);
  check_error(ret == 0, "Examine file returned error");

  // Parse the vm file
  ret = advance(&fileInfo);
  check_error_silent(ret == 0);

  llDelete();
  return 0;
error:
  llDelete();
  exit(1);
}
