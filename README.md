sudo apt-get install git wget flex bison gperf python3 python3-pip python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0


`
mkdir -p ~/esp
cd ~/esp
git clone -b v5.2.1 --recursive https://github.com/espressif/esp-idf.git
`

`
cd ~/esp/esp-idf
export IDF_GITHUB_ASSETS="dl.espressif.com/github_assets"
export IDF_TOOLS_PATH="/installation/path"    # default path $HOME/.espressif

./install.sh esp32
`

`
. $HOME/esp/esp-idf/export.sh
`

Or add to profile

`
alias get_idf='. $HOME/esp/esp-idf/export.sh'
`
`
cd ~/esp
cp -r $IDF_PATH/examples/get-started/hello_world .
`

note: IDF_PATH=/home/anuragjk/esp/esp-idf

`
cd ~/esp/hello_world
idf.py set-target esp32
idf.py menuconfig
`
`
$ idf.py build
`

`$ idf.py -p <PORT> flash`
                                # PORT is /dev/ttyUSB0 or whichever device ESP is connected to

`$ idf.py -p <PORT> monitor`





