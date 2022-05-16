#!/bin/zsh

VERIFICA E INSTALA
ZIP='ntm.zip'
URL=
wget -O $ZIP $URL
unzip $ZIP -d $HOME/

if [ -f $ZIP ]
then
  rm $ZIP
fi

BASHRC=$HOME/.bashrc
exec_bash() {
cat >> $BASHRC << EOF

# ntm
if [ -f ~/.ntm/ntm_aliases  ]; then
  . ~/.ntm/ntm_aliases 
fi

EOF
}

ZSHRC=$HOME/.zshrc
exec_zsh() {
cat >> $ZSHRC << EOF

# ntm
if [ -f ~/.ntm/ntm_aliases  ]; then
  . ~/.ntm/ntm_aliases 
fi

EOF
}

if [ -f ~/.zshrc ]; then
  exec_zsh
fi

if [ -f ~/.bashrc ]; then
  exec_bash
fi

# Teste o código de retorno para constatar se o arquivo foi criado ou não
if [ $? -eq 0 ]; then
  echo "ntm instalado com sucesso."
else
  echo "não foi posivel instalar o ntm"
fi

exit $?
