#!/bin/bash
echo "WAIT A SECOND"
rm -f /home/ctfuser/challenge/Dockerfile

mkdir -p challenge/ctf_files
cd challenge/ctf_files

# Fisierul 1: contine multe linii, ultimele 5 sunt flag{
touch file1.txt
random_line=" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras aliquam lorem sit amet risus interdum ultricies. Nunc euismod gravida nibh, in pharetra purus rutrum quis. Maecenas faucibus odio in mauris elementum, vel tristique erat aliquet. Vivamus blandit justo eros, non ultrices erat tempor ut. Sed posuere aliquet nulla molestie hendrerit. Quisque ante nibh, elementum nec viverra in, euismod nec est. Vestibulum dignissim sit amet odio ut vestibulum. In hac habitasse platea dictumst. Nam vel nisl ac augue faucibus sollicitudin eget sit amet tortor. In congue lacinia nunc, ac luctus enim. Maecenas finibus nisl id consequat mollis. Pellentesque molestie id purus ut efficitur.

Donec in ligula sollicitudin, aliquam ipsum nec, commodo sapien. Nunc sollicitudin vestibulum sapien, sit amet consequat enim venenatis id. Sed porta augue diam, eget ullamcorper ligula luctus eu. Fusce ut sapien arcu. Donec sit amet justo aliquam, tincidunt leo nec, porta nulla. In faucibus ex quis orci tincidunt, in viverra erat sollicitudin. Quisque vehicula aliquet enim, a sagittis erat tincidunt a. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In nec nulla viverra, tincidunt libero vel, facilisis tortor. Aliquam iaculis mi arcu, a interdum diam pharetra vitae. Quisque hendrerit leo non tellus dapibus imperdiet.

Aenean quis orci vitae orci aliquet congue id vitae odio. Sed eget vestibulum nulla. Fusce eget consectetur neque. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In eget mollis nisl. Nulla tristique et augue nec ultricies. Curabitur ultricies justo id libero condimentum, at eleifend tortor pellentesque. Aliquam sagittis et nisi eu iaculis. Nullam finibus tempor augue, non tristique leo tempus vehicula. Maecenas pulvinar diam eu arcu auctor, et convallis justo aliquet. Pellentesque consequat ipsum ligula, nec tristique leo vestibulum et.

Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam luctus sem nulla, vel viverra eros fringilla ut. Aenean hendrerit malesuada consequat. Aliquam posuere enim ac urna auctor ullamcorper. Donec bibendum arcu tempor metus pharetra, sit amet congue ex consequat. Duis aliquet auctor sapien, porta sodales mauris efficitur eu. Nulla bibendum aliquet orci, non faucibus elit porttitor vel. Mauris ante neque, dapibus id feugiat eu, viverra ut dolor. Vestibulum sed gravida erat, vitae tempor mi.

Curabitur condimentum aliquam magna, sit amet efficitur velit tincidunt non. Etiam scelerisque libero augue, et bibendum mi vestibulum et. Fusce iaculis, ipsum a consectetur facilisis, lectus lacus pellentesque mauris, non consequat nisi augue a nunc. Donec a semper nulla. Phasellus iaculis magna ut lacus fermentum fringilla. Nulla ac consequat lectus. Curabitur ut interdum tellus. Vivamus quis diam ut massa ultricies maximus ut a mauris. Sed aliquam leo nulla, vel varius odio faucibus ac. Donec dapibus rutrum felis a rutrum. Donec in risus erat. Proin vehicula tempus velit a placerat. Nulla ac luctus libero. In aliquet vulputate sagittis.

Nullam vel elit in sapien malesuada posuere id eu eros. Morbi felis purus, congue at elit eu, tristique gravida massa. Mauris mattis dignissim consequat. In egestas vitae augue quis aliquam. Vivamus iaculis volutpat purus, vel convallis felis consequat sed. Donec vitae libero tincidunt, maximus leo ac, scelerisque ex. In auctor faucibus rutrum. Donec ullamcorper quam imperdiet tellus dictum, non vehicula elit rutrum. Sed eget nibh et magna porttitor ultricies eu ac nibh. Maecenas feugiat purus massa, et faucibus nisl accumsan quis. Nullam pharetra elementum sem, nec luctus lacus cursus non. Phasellus malesuada bibendum diam in ullamcorper. Vivamus condimentum urna non leo hendrerit sollicitudin. Donec ullamcorper diam eget arcu dapibus rutrum.

Nullam consectetur odio massa, eget consectetur leo consequat semper. Cras porta mauris at lectus sollicitudin scelerisque. Donec suscipit tempor neque in viverra. Pellentesque vitae rutrum diam. Phasellus quis metus mattis lectus gravida facilisis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum vel posuere neque.

Quisque eros nibh, tempor euismod augue vulputate, auctor efficitur quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent vel est eu turpis eleifend vulputate vitae sed justo. Suspendisse ut enim sed diam faucibus hendrerit sodales sed tellus. Sed a sapien vel nisi malesuada porta at sit amet neque. Cras luctus et nulla maximus auctor. Duis quis lobortis ipsum. Vivamus egestas dolor nec felis laoreet fermentum. In tristique pharetra convallis. Pellentesque sed condimentum sapien, sit amet aliquam nulla.

Cras in nibh pharetra, lobortis libero et, pharetra orci. Morbi sit amet mattis quam, sed varius mi. In egestas pretium tempus. Aliquam id augue tortor. Ut sed ullamcorper urna. Praesent porta iaculis augue sed varius. Quisque in odio posuere, ullamcorper ante sed, vestibulum eros. Ut sollicitudin eget sem quis sollicitudin. Aliquam vulputate quam vitae tellus cursus consectetur. Nam blandit mauris et eleifend dictum. Aliquam euismod elit porta, accumsan ligula id, ullamcorper lacus. Cras cursus iaculis libero eget commodo. Proin congue, tortor at cursus sagittis, nisi nunc fermentum nunc, ac hendrerit odio elit at odio. Cras at augue ornare, ullamcorper quam id, auctor velit.

Donec consectetur gravida nisi, non pulvinar purus. Donec sit amet orci eu nibh fermentum suscipit. Aenean rutrum, magna id tempor blandit, ipsum leo egestas nunc, eget lobortis ipsum leo nec justo. Integer nec enim urna. Fusce consequat, massa vitae convallis convallis, diam dui cursus ligula, sed convallis magna enim non odio. Integer gravida sodales nisi non bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam pulvinar venenatis nisi, vel tincidunt diam viverra et. Duis dictum quam odio, at finibus dolor pellentesque sit amet. Nunc vulputate justo vitae tortor venenatis fringilla. Sed erat ex, mattis eu enim at, dapibus feugiat ipsum. Cras eleifend nibh non risus posuere, sed aliquam tellus lacinia. Ut viverra, justo in posuere placerat, ligula lectus sagittis augue, ut venenatis tortor eros sed elit. Suspendisse eleifend, enim at laoreet aliquet, turpis lorem ultricies lacus, sed pretium neque odio vel orci. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Phasellus ut sodales enim.

"
echo "$random_line" >> file1.txt
echo "flag{" >> file1.txt
echo "L4b " >> file1.txt
echo "0r4" >> file1.txt
for i in {1..100}; do echo "$random_line" >> file1.txt; done

# Fisierele 2-10: primele 7 linii contin litere din flag si restul sunt linii aleatorii
flag="t0r_C0m3nz1_L1nuxx_2025 "
for i in {2..10}; do
  touch "file${i}.txt"
  for j in {1..7}; do echo "${flag:$(( (j-1) )):1}" >> "file${i}.txt"; echo "${flag:$(( (j-1) )):1}" >> "file${i}.txt"; done
  for k in {8..50}; do echo "$random_line" >> "file${i}.txt"; done
done

for i in {2..10}; do
  for k in {8..50}; do echo "$random_line" >> "file${i}.txt"; done
  for j in {8..24}; do echo "${flag:$(( (j-1) )):1}" >> "file${i}.txt"; echo "${flag:$(( (j-1) )):1}" >> "file${i}.txt"; done
done

touch file11.txt
touch file12.txt

nr_linii_fisier1=`wc -l file1.txt| cut -f 1 -d" "`

echo -e "$nr_linii_fisier1 ""REsTanTa\n" >> file11.txt
echo "$nr_linii_fisier1 ""Nu LuAm}" >> file12.txt
cd /home/ctfuser/challenge
rm -f /home/ctfuser/challenge/verificare_flag.c
echo "Setup completed"
rm -f /home/ctfuser/challenge/start.sh 
