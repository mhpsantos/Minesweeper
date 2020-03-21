algoritmo "semnome"
// Função :
// Autor :
// Data : 02/07/2016
// Seção de Declarações
var
nbombas, dif, x, y , a, qbombas, qb, i, j,jgnv,pont,opj,fim,cb,sair,aux:inteiro
m:vetor[1..10,1..10] de inteiro
nome,nomeaux:caracter
mc:vetor[1..10,1..10] de inteiro
nomer:vetor[1..5] de caracter
rank:vetor[1..5] de inteiro
inicio
// Seção de Comandos
qbombas<-10
dif<-1
repita
   a<-4

   repita
      escreval("1 - Jogar")
      escreval("2 - Selecionar dificuldade")
      escreval("3 - Ranking")
      escreval("4 - Sair")
      escreval("Dificuldade:",dif)
      leia(a)
      limpatela
      se a=2 entao
         limpatela
         escreval("Digite o nivel de dificuldade")
         leia(dif)
         se dif=1 entao
            qbombas<-10
         fimse
         se dif = 2 entao
            qbombas<-20
         fimse
         se dif =3 entao
            qbombas<-40
         fimse
         limpatela
      fimse
      se a=3 entao
         escreval("Ranking")
         para i de 1 ate 5 faca
            escreva(i," - ",nomer[i],"/",rank[i])
            escreval("")
         fimpara
         escreval("")
         escreval("")
      fimse
      se a=4 entao
      fimalgoritmo
   fimse
ate a=1
qb<-qbombas
//ORGANIZACAO DO TABULEIRO
para i de 1 ate 10 faca
   para j de 1 ate 10 faca
      se dif = 1 entao
         se qb >0 entao
            m[i,j]<-randi (7)
            se m[i,j]=1 entao
               qb<-qb-1
            fimse
         fimse
      fimse
      se dif = 2 entao
         se qb >0 entao
            m[i,j]<-randi (4)
            se m[i,j]=1 entao
               qb<-qb-1
            fimse
         fimse
      fimse
      se dif = 3 entao
         se qb >0 entao
            m[i,j]<-randi (2)
            se m[i,j]=1 entao
               qb<-qb-1
            fimse
         fimse
      fimse
      se m[i,j] <> 1 entao
         m[i,j]<-10
      fimse
      se m[i,j]=1 entao
         m[i,j]<-11
      fimse
      mc[i,j]<-m[i,j]
   fimpara
fimpara
limpatela
escreval("Digite seu nome")
leia(nome)
escreval("     1  2  3  4  5  6  7  8  9  10")
escreval("")
para i de 1 ate 10 faca
   escreva(i)
   escreva("   ")
   para j de 1 ate 10 faca
      se (mc[i,j]<9) entao
         escreva(mc[i,j])
      fimse
      se (mc[i,j] = 11) ou (mc[i,j] = 10) entao
         escreva(".")
      fimse
      se mc[i,j]=-1 entao
         escreva("<|")
      fimse
      se mc [i,j] = -2 entao
         escreva("?")
      fimse
      se mc[i,j] = -4 entao
         escreva (" ")
      fimse
      escreva("  ")
   fimpara
   escreval("")
fimpara
//
repita
   //JOGAR
   escreval("Bombas restantes:",qbombas)
   escreval("Digite a posição que deseja jogar")
   leia(x,y)
   escreval("Como deseja agir?")
   escreval("1 - Bandeira de bomba")
   escreval("2 - Dúvida de bomba")
   escreval("3 - Visitar a posição")
   leia(opj)
   se opj = 1 entao
      mc[x,y]<- -1
      qbombas<- qbombas-1
   fimse
   se opj = 2 entao
      mc[x,y]<- -2
      qbombas<- qbombas-1
   fimse
   se opj=3 entao
      se m[x,y]=11 entao
         fim<-1
      fimse
      se fim=0 entao
         //BOMBAS AO REDOR DA CASA
         se (y+1<10) e (x+1<10) entao
            se m[x+1,y]=11 entao
               cb<-cb+1
            fimse
            se m[x+1,y+1]=11 entao
               cb<-cb+1
            fimse
            se m[x,y+1]=11 entao
               cb<-cb+1
            fimse
         fimse
         se (x-1>0) e (y-1>0) entao
            se m[x-1,y]=11 entao
               cb<-cb+1
            fimse
            se m[x,y-1]=11 entao
               cb<-cb+1
            fimse
            se m[x-1,y-1]=11 entao
               cb<-cb+1
            fimse
         fimse
         se (x-1>0) e (y+1<10)entao
            se m[x-1,y+1]=11 entao
               cb<-cb+1
            fimse
         fimse
         se (x+1<10) e (y-1>0) entao
            se mc[x+1,y-1]=11 entao
               cb<-cb+1
            fimse
         fimse
         mc[x,y]<-cb
      fimse
      pont<-pont+1
   fimse
   cb<-0
   //--
   //MOSTRA A MATRIZ
   limpatela
   escreval("      1  2  3  4  5  6  7  8  9  10")
   escreval("")
   para i de 1 ate 10 faca
      escreva(i)
      escreva("   ")
      para j de 1 ate 10 faca
         se (mc[i,j]<9) e (mc[i,j]>=0) entao
            escreva(mc[i,j])
         fimse
         se (mc[i,j] = 11) ou (mc[i,j] = 10) entao
            escreva(".")
         fimse
         se mc[i,j]=-1 entao
            escreva("=")
         fimse
         se mc [i,j] = -2 entao
            escreva("?")
         fimse
         se mc[i,j] = -4 entao
            escreva (" ")
         fimse
         escreva("  ")
      fimpara
      escreval("")
   fimpara
   //--
ate  fim =1
fim<-0
limpatela
//FIM DE JOGO/JOGAR NOVAMENTE
escreval("Voce perdeu")
para i de 1 ate 10 faca
   para j de 1 ate 10 faca
      se m[i,j]=11 entao
         escreva("#")
      fimse
      se m[i,j]=10 entao
         escreva("-")
      fimse
      escreva("  ")
   fimpara
   escreval("")
fimpara
escreval("Deseja jogar novamente?")
leia(jgnv)
se jgnv=1 entao
   sair<-0
senao
   sair<-1
fimse
//--
//RANKING
limpatela
se pont>rank[5] entao
   rank [5]<-pont
   nomer[5]<-nome
fimse
pont<-0
para i de 5 ate 2 passo -1 faca
   se rank[i]>rank[i-1] entao
      aux<-rank[i-1]
      nomeaux<-nomer[i-1]
      rank[i-1]<-rank[i]
      nomer[i-1]<-nomer[i]
      rank[i]<-aux
      nomer[i]<-nomeaux
   fimse
fimpara
ate sair=1
fimalgoritmo
