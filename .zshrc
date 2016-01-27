# ~/.zsh/init内のファイルを読み込む
#~/.zsh/functions内の関数定義用スクリプトも読み込む
# http://d.hatena.ne.jp/dgdg/20071127/1196179056
ZSHHOMES=("${HOME}/.zsh/init" "${HOME}/.zsh/functions")
for ZSHHOME in $ZSHHOMES
do
    if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
    # .で始まるファイルはスキップされる
        for i in $ZSHHOME/*; do
        # ~で終わるファイルもスキップする
            [[ ${i##*/} != *~ ]] \
                && \
                [ \( -f $i -o -h $i \) -a -r $i ] \
                && . $i
        done
    fi
done
