use v6;

say [+] (1, 2, * + * ...^ * > 4e6).grep: * %% 2
