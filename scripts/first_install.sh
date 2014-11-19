#!/bin/bash -ev

pacman --sync --refresh --upgrades --needed --noconfirm git
git clone git@github.com:stupied4ever/dev-box
cd dev-box
make
