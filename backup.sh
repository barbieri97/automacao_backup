#!/bin/bash
# usa o comando df para informações de memoria da pasta /media e joga para o coamando awk que vai selecionar as informações da coluna 5 somente
uso=$(df -h /media | awk {'print $5'}) 
# remove o cabeçalho da coluna 5 que vem do comando df e deixa só o valor da coluna 5 que é a porcentagem da memória que a pasta esta usando
uso_da_pasta=$(echo $uso | awk {'print $2'})

# uso o condicional if para verificar se a porcentagem esta acima de 80%
if [[ $uso_da_pasta =~ [8-9][0-9]%$|100% ]]; then # aqui usei um expressão regular para verificar qualquer valor entre 80% e 100% já que a comparação de strings não daria muito certo
    # crio um arquivo no desktop informando que a memória está cheia e aviso que o backup não foi feito
    echo 'a memoria do armazenamento de arquivos está cheia' > /home/barbieri/Desktop/alerta_memoria_cheia`date +%d%m%Y`.txt
    echo 'o uso da pasta /media esta em' $uso_da_pasta >> /home/barbieri/Desktop/alerta_memoria_cheia`date +%d%m%Y`.txt
    echo por isso o backup do dia `date +%d/%m/%Y` não foi feito >> /home/barbieri/Desktop/alerta_memoria_cheia`date +%d%m%Y`.txt
else
    # se a memória estiver abaixo dos 80% faz o backup normalmente
    tar -zcf /media/backups/backup`date +%Y%m%d`.tar.gz /media/barbieri
fi