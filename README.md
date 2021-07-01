# SCRIPT PARA BACKUP

Nesse scrip usei o comando `df -h` para colher informaçãoes sobre o uso da pasta que utilizo para armazenar os meus arquivos

A unica informação que me era interessante era a porcerntagem de uso da memoria

Para acessar esse valor utilizei o `awk {'print $5'}` para acessar esse valor que precisava

Comparo esse valor obtido com um valor que determinei de 80% e se estiver abaixo, ele faz o backup normalmente
Se estiver acima ele envia um arquivo avisando a situação para area de trabalho e não realiza o backup