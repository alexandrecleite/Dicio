#!/usr/bin/env bash
palavra=$(sed 'y/áÁàÀãÃâÂéÉêÊíÍóÓõÕôÔúÚçÇ/aAaAaAaAeEeEiIoOoOoOuUcC/' <<<$1)
result=$(lynx -dump -nonumbers https://www.dicio.com.br/$palavra | sed -n '14p')
if [[ "$result" != *"$1"* ]] && [[ $result != *"$palavra"* ]]; then
	printf "Palavra não encontrada.\n\n"
else
	lynx -dump -nonumbers https://www.dicio.com.br/$palavra | sed -n '20,/Definição/p' | head -n -1
fi
exit
