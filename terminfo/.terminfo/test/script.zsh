#! /usr/bin/env zsh

# ref: https://unix.stackexchange.com/a/404415
# Based on: https://gist.github.com/XVilka/8346728
awk -v term_cols="${width:-$(tput cols || echo 80)}" 'BEGIN{
    s="/\\";
    for (colnum = 0; colnum<term_cols; colnum++) {
        r = 255-(colnum*255/term_cols);
        g = (colnum*510/term_cols);
        b = (colnum*255/term_cols);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum%2+1,1);
    }
    printf "\n";
}'

# ref: https://askubuntu.com/a/528938 -- run these in a terminal
echo -e "\e[1mbold\e[0m"
echo -e "\e[3mitalic\e[0m"
echo -e "\e[3m\e[1mbold italic\e[0m"
echo -e "\e[4munderline\e[0m"
echo -e "\e[9mstrikethrough\e[0m"
echo -e "\e[31mHello World\e[0m"
echo -e "\x1B[31mHello World\e[0m"
echo -e "\n"

# ref: https://askubuntu.com/a/985386 -- run these in a terminal
echo -e "\e[1mbold\e[22m"
echo -e "\e[2mdim\e[22m"
echo -e "\e[3mitalic\e[23m"
echo -e "\e[4munderline\e[24m"
echo -e "\e[4:1mthis is also underline (new in 0.52)\e[4:0m"
echo -e "\e[21mdouble underline (new in 0.52)\e[24m"
echo -e "\e[4:2mthis is also double underline (new in 0.52)\e[4:0m"
echo -e "\e[4:3mcurly underline (new in 0.52)\e[4:0m"
echo -e "\e[5mblink (new in 0.52)\e[25m"
echo -e "\e[7mreverse\e[27m"
echo -e "\e[8minvisible\e[28m <- invisible (but copy-pasteable)"
echo -e "\e[9mstrikethrough\e[29m"
echo -e "\e[53moverline (new in 0.52)\e[55m"

echo -e "\e[31mred\e[39m"
echo -e "\e[91mbright red\e[39m"
echo -e "\e[38:5:42m256-color, de jure standard (ITU-T T.416)\e[39m"
echo -e "\e[38;5;42m256-color, de facto standard (commonly used)\e[39m"
echo -e "\e[38:2::240:143:104mtruecolor, de jure standard (ITU-T T.416) (new in 0.52)\e[39m"
echo -e "\e[38:2:240:143:104mtruecolor, rarely used incorrect format (might be removed at some point)\e[39m"
echo -e "\e[38;2;240;143;104mtruecolor, de facto standard (commonly used)\e[39m"

echo -e "\e[46mcyan background\e[49m"
echo -e "\e[106mbright cyan background\e[49m"
echo -e "\e[48:5:42m256-color background, de jure standard (ITU-T T.416)\e[49m"
echo -e "\e[48;5;42m256-color background, de facto standard (commonly used)\e[49m"
echo -e "\e[48:2::240:143:104mtruecolor background, de jure standard (ITU-T T.416) (new in 0.52)\e[49m"
echo -e "\e[48:2:240:143:104mtruecolor background, rarely used incorrect format (might be removed at some point)\e[49m"
echo -e "\e[48;2;240;143;104mtruecolor background, de facto standard (commonly used)\e[49m"

echo -e "\e[21m\e[58:5:42m256-color underline (new in 0.52)\e[59m\e[24m"
echo -e "\e[21m\e[58;5;42m256-color underline (new in 0.52)\e[59m\e[24m"
echo -e "\e[4:3m\e[58:2::240:143:104mtruecolor underline (new in 0.52) (*)\e[59m\e[4:0m"
echo -e "\e[4:3m\e[58:2:240:143:104mtruecolor underline (new in 0.52) (might be removed at some point) (*)\e[59m\e[4:0m"
echo -e "\e[4:3m\e[58;2;240;143;104mtruecolor underline (new in 0.52) (*)\e[59m\e[4:0m"

echo -e "\e]8;;http://askubuntu.com\e\\hyperlink\e]8;;\e\\"

# check out the following files for emoji and UTF-8 support
#curl -LO 'https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'
#curl -LO 'https://unicode.org/Public/emoji/11.0/emoji-test.txt'
