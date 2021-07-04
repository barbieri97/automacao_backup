# SCRIPT PARA BACKUP

Nesse scrip usei o comando `df -h` para colher informaçãoes sobre o uso da pasta que utilizo para armazenar os meus arquivos.

A unica informação que me era interessante era a porcerntagem de uso da memoria.

Para acessar esse valor utilizei o `awk {'print $5'}` para acessar esse valor que precisava.

Comparo esse valor obtido com um valor que determinei de 80% e se estiver abaixo, ele faz o backup normalmente.
Se estiver acima ele envia um arquivo avisando a situação para area de trabalho e não realiza o backup.

## execução automatica

Colequei esse programa para ser executado automaticamente uma vez por semana na minha maquina
para isso usei `crontab -e` e adicionei, no arquivo que abriu a seguinte linha:
* * * * 7 <path/to/script.sh>

assim o programa é executado todos os domingos. 

pode-se alterar os asteristicos para que o prgama seja executado em determinados meses, diasm horarios e minutos.