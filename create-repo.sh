#!/usr/bin/env bash

src="../Ajab-Shahar-TW/src/main/resources/assets/app"
test_src="../Ajab-Shahar-TW/src/test/js"

root_dir="../Ajab-Shahar-TW/web"

rm -rf ${root_dir}
mkdir ${root_dir}

cp -R ${src} ${root_dir}
cp -R ${test_src} ${root_dir}/test


#files_to_modify="-name \"*.html\" -o -name \"*.scss\""


patterns[0]="\.\.\/.*user-js;\/user\/js"
patterns[1]="\/user-js;\/user\/js"
patterns[2]="user-js;\/user\/js"

patterns[3]="\.\.\/.*user-css;\/user\/css"
patterns[4]="\/user-css;\/user\/css"

patterns[5]="\.\.\/.*user-img;\/user\/img"
patterns[6]="\/user-img;\/user\/img"

patterns[7]="\"\/admin\/;\"\/admin\/partials\/"
patterns[8]="\.\.\/.*admin-js;\/admin\/js"
patterns[9]="\/admin-js;\/admin\/js"
patterns[10]="\.\.\/.*admin-img;\/admin\/img"
patterns[11]="\.\.\/.*admin-css;\/admin\/css"


patterns[12]="\.\.\/.*common;\/common"

patterns[13]="\/pendingPages;\/user\/partials\/common"

patterns[14]="href=\"\/songs;href=\"\/user\/partials\/songs"
patterns[15]="href=\"\/words;href=\"\/user\/partials\/words"
patterns[16]="href=\"\/reflections;href=\"\/user\/partials\/reflections"
patterns[17]="href=\"\/people;href=\"\/user\/partials\/people"
patterns[18]="href=\"\/common;href=\"\/user\/partials\/common"
patterns[19]="href=\"\/featuredContent;href=\"\/user\/partials\/featuredContent"
patterns[20]="href=\"\/couplets;href=\"\/user\/partials\/couplets"

patterns[21]="\/user\/partials\/common\/jquery\/jcarousel\/jcarousel\.responsive\.css;\/common\/jquery\/jcarousel\/jcarousel\.responsive\.css"
patterns[22]="\/user\/partials\/common\/jquery\/jcarousel\/jcarousel\.responsive\.css;\/common\/jquery\/jcarousel\/jcarousel\.responsive\.css"

patterns[23]="\/common\/lib\/bourbon\/app\/assets\/stylesheets\/bourbon;\.\.\/\.\.\/common\/lib\/bourbon\/app\/assets\/stylesheets\/bourbon"
patterns[24]="\/common\/lib\/neat\/app\/assets\/stylesheets\/neat;\.\.\/\.\.\/common\/lib\/neat\/app\/assets\/stylesheets\/neat"
patterns[25]="\/user\/partials\/common\/lib;\/common\/lib"
patterns[26]="admin\/home.html;admin\/partials\/home.html"
patterns[27]="admin\/signin.html;admin\/partials\/signin.html"


for pattern in "${patterns[@]}"
do
# split the from and to patterns into an array
    from_to=(${pattern//;/ })
    from=${from_to[0]}
    to=${from_to[1]}
#    find ${root_dir} -type f ${files_to_modify} -exec sed -i -- "s/${from}/${to}/g" {} +
#    find ${root_dir} -type f ${files_to_modify}
    find ${root_dir}/app -type f -name "*.html" -exec sed -i "" "s/${from}/${to}/g" {} +
    find ${root_dir}/app -type f -name "*.scss" -exec sed -i "" "s/${from}/${to}/g" {} +
    find ${root_dir}/app -type f -name "*.js" -exec sed -i "" "s/${from}/${to}/g" {} +
#    find ${root_dir}/app/admin/partials/songs -type f -name "details.html" -exec sed -i "" "s/${from}/${to}/g" {} +
#    echo ${files_to_modify}
done


test_patterns[0]="admin\/home.html;admin\/partials\/home.html"
test_patterns[1]="admin\/signin.html;admin\/partials\/signin.html"
test_patterns[2]="\/user-js;\/user\/js"
test_patterns[3]="\/admin-js;\/admin\/js"
test_patterns[4]="\.\.\/\.\.\/\.\.\/main\/resources\/assets\/app;\.\.\/\.\.\/app"
test_patterns[5]="\.\.\/\.\.\/\.\.\/\.\.\/test\/js\/unit\/\*\*\/\*\.js;\.\.\/test\/unit\/\*\*\/\*\.js"
test_patterns[6]="\.\.\/\.\.\/test\/js\/config\/karma\.dev\.conf\.js;config\/karma\.dev\.conf\.js"
test_patterns[6]="\.\.\/\.\.\/test\/js\/config\/karma\.conf\.js;config\/karma\.conf\.js"
test_patterns[7]="\.\.\/\.\.\/\.\.\/node_modules\/karma\/bin\/karma;\.\.\/\.\.\/node_modules\/karma\/bin\/karma"

for pattern in "${test_patterns[@]}"
do
# split the from and to patterns into an array
    from_to=(${pattern//;/ })
    from=${from_to[0]}
    to=${from_to[1]}
#    find ${root_dir} -type f ${files_to_modify} -exec sed -i -- "s/${from}/${to}/g" {} +
#    find ${root_dir} -type f ${files_to_modify}
    find ${root_dir}/test -type f -name "*.html" -exec sed -i "" "s/${from}/${to}/g" {} +
    find ${root_dir}/test -type f -name "*.js" -exec sed -i "" "s/${from}/${to}/g" {} +
    find ${root_dir}/test -type f -name "*.sh" -exec sed -i "" "s/${from}/${to}/g" {} +
#    find ${root_dir}/app/admin/partials/songs -type f -name "details.html" -exec sed -i "" "s/${from}/${to}/g" {} +
#    echo ${files_to_modify}
done




