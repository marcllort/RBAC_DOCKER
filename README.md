# rbacF2
To make the devian package run 
dpkg-buildpackage -b -rfakeroot -us -uc
from inside the rbac-0.2 folder
then sudo aot install ./<Nom del .deb>

lib modules no copiar-lo per tal de que els .tar i les imatges no ocupin tant, també podriem mirar de treure altres llibreries innecesaries

1. CREAR LA DOCKER IMAGE: 

sudo tar -c . | sudo docker import - medium

2. Crear un fitxer executable a bin i substituir al fitxer etc/passwd per el nostre fitxer que conté aquesta línia

docker run -i -t medium /bin/bash

Canviat fixer /etc/passwd porque en comptes de executar /bin/bash al entrar executi /bin/bash1 

posar el usuari al grup de docker perque puguis iniciar sessio


Posar rbac com a executable



Un script porque al iniciar el container porque es mantingui obert. Creo el container, l’encenc I entro. Al sortir fait exit i el conteiner s’hauria d’apagar. Quan surts del container no varig a la shell del servidor. Això es fa amb docker attach.Canviar la shell axí quan fas el exit, com deixa de tenir shell es desconecta.
