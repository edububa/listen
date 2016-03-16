//
//  auxiliar.cpp
//  playList
//
//  Created by Luis Eduardo Bueso on 24/1/16.
//  Copyright © 2016 Luis Eduardo Bueso. All rights reserved.
//

#include "auxiliar.hpp"
#include <stdlib.h>
#include <unistd.h>

void play(char* path, char* song) {
    execl(path, "afplay", song);
}