#import "@preview/great-theorems:0.1.2": *
#import "@preview/fletcher:0.5.8": *

#set document(
    title: "Конспект по рациональной теории гомотопий",
)

#set page(
  paper: "a4",
  margin: (left: 1cm, right: 1cm, top: 1.5cm, bottom: 3.3cm),
)

#set page(footer: context [
  #let heading-text

  #let headings = query(selector(heading.where(level: 1)).before(here()))
  #if counter(page).get().first() > 1{
    if headings.len() > 0 {
        let current-heading = headings.last() 
        heading-text = current-heading.body
    }

    align(center)[
      #set text(size: 9pt)
      #v(1cm)
      #line(length: 100%, stroke: 0.3pt + black)
      #heading-text #h(1fr) #counter(page).display()
      #v(0.15em)
      #line(length: 100%, stroke: 0.3pt + black)
    ]
  }
])

#set text(12pt)

#show heading.where(level: 1): set block(below: 2em)

#show heading.where(level: 2): it => {
  v(2em)
  it
  v(-0.7em)
  line(length: 30%, stroke: 1pt)
  v(1em)
}

#show: great-theorems-init

#let theorem = mathblock(
    blocktitle: "Теорема",
    counter: none,
    fill: color.linear-rgb(100%, 63.76%, 63.76%), 
    inset: 10pt,
)

#let corollary = mathblock(
    blocktitle: "Следствие",
    counter: none,
    inset: 10pt
)

#let lemma = mathblock(
    blocktitle: "Лемма",
    counter: none,
    fill: oklab(95.23%, -0.068, 0.032),
    inset: 10pt,
)

#let statement = mathblock(
    blocktitle: "Утверждение",
    counter: none,
    inset: 10pt
)

#let definition = mathblock(
    blocktitle: "Определение",
    counter: none, 
    fill: blue.lighten(80%),
    inset: 10pt,
)

#let remark = mathblock(
    blocktitle: "Замечание",
    counter: none, 
    inset: 10pt
)

#let example = mathblock(
    blocktitle: "Пример",
    counter: none, 
    fill: oklch(92.26%, 0.114, 100.74deg),
    inset: 10pt,
)

#let proof = proofblock(prefix: [_Доказательство_:#h(1cm)], suffix: [#h(1fr) $square$])

#let lecture(date) = [ 
  #context {
    v(1em)
    align(center)[
      #box(
        stroke: 0.5pt + black,
        inset: 10pt,
        [
          #set text(12pt, weight: "bold")
          #text(16pt, weight: "bold")[Лекция от #date]\
        ]
      )
    ]
  }
]

#align(center + horizon)[
    #show title: set text(size: 24pt, weight: "bold")
    #title()
    #v(1.5em)
    #text(18pt)[Лектор: Ионин Василий]
    #v(1.5em)
    #text(18pt)[Автор: Артемий Дружинин]
    #v(1em)
    #text(14pt)[Факультет МКН СПБГУ]
    #v(1em)
    #text(12pt)[Осенний семестр 2026]
]

#pagebreak()

#outline(title: "Оглавление")

#pagebreak()

#align(center)[#text(size: 20pt)[= Рефлективные категории.]]

#lecture("05.09.2026")

== Основные определения и мотивация.

#definition[
  Пусть $C subset F$ -- подкатегория, она называется *рефлеквиной*, если у функтора вложения $"In":C-->F$ есть сопряженный.
]

Пусть $D$ -- рефлективная подкатегория в $C$. Рассмотрим следующую композицию функторов:
$
  L:(C-->D arrow.r.hook C)
$
Рассмотрим преобразование $eta:"Id"==>L$ и $eta_X:X-->L X$, будем называть ($L,eta_X$) *pointed* функтором.

#definition[
  pointed функтор $(L,eta)$ будем называть *рефлективной локализацией*, если 
  $
    L(eta_X), space eta_(L_X):L X tilde.eq L^2 X
  $ 
]

Пусть $L$ -- локализация на $C$,
$
  "Im"(L) = {L X | X in C} subset_"full" C - L"-локальные объекты"\
  L^(-1) ("iso") = {f in "Mor" C | L f - "iso"} --L"-экивиалентности"
$
Можно заметить, что локализация оопределятеся полностью своими локальными объектами. То же можно сказать и о экивалентностях:
#statement[
  Морфизм $f:X-->Y$ является $L$-эквивалентностью $<==>space forall A$ локального:
  $
    "Hom"(f,A): "Hom"(Y,A) --> ^(tilde.eq) "Hom"(X,A)
  $
  Иными словами любой морфизм из $X$ в $A$ можно представить в виде композиции $f$ и морфизма из $Y$ в $A$:
  #align(center, diagram({
    node((-1, 0), [$X$])
    node((1, 0), [$Y$])
    node((0, 1), [$A$])
    edge((-1, 0), (1, 0), [$f$], label-side: left, "->")
    edge((-1, 0), (0, 1), [$forall$], label-side: right, "->")
    edge((1, 0), (0, 1), [$exists!$], label-side: left, "-->")
  }))
]

#example[
  Хотим обратить стрелку $ZZ-->QQ$. Можем сказать, что абелева группа $L_QQ$ локальна, если 
  $
    "Hom"(QQ,A)-->^(tilde.eq)"Hom"(ZZ,A) = A
  $
  И по этим объектам строим уже локализацию, причем в ней экивиалентности будут порождатся этой стрелкой -- победа.
]

#v(1cm)

#definition[
  $f:X-->Y$ - морфизм категории пространств, называется *рациональной эквивалентностью*, если
  $
    forall x in X, space forall n: space pi_n (X,x) times.o QQ -->^(pi_n (f) times.o id)_tilde.eq pi_n (Y,f(x))times.o QQ
  $
]

#definition[
  $A$ называется *$QQ$-локальным*, если $pi_n (A,a)$ -- $QQ$-векторное пространство ($forall n, space forall a in A$) 
]
Очевидно можно построить соответствующую локализацию $X-->X_QQ$.\
Хотим изобрести единицу локализации $(eta)$:
#definition[
  Будем рассматривать односвязные пространства $("Spc"^(>1))$. *Рационализация* -- это естественное преобразование $eta:"Id"==>(-)_QQ$ что $X-->X_QQ$ -- рациональная эквивалентность и $X_QQ$ -- $QQ$-локально
]
#remark[
  По другому универсальное свойство $eta$ можно записать так:
  $
    "map"(X_QQ,A)-->^(tilde.eq)"map"(X,A)
  $
  Где под эквивалентноостью подразумевается слабая гомотопическая эквивалентность пространств стрелок.
]

#lecture("11.09.2026")

== $Delta$-порожденные пространства.

Хотим найти "хорошую" подкатегорию в $T o p$

#definition[
   $X in T o p$ --*$Delta$-порожденный*, если:
   $
     forall S subset X <==> forall f:[0,1]--> X, space f^(-1) (S) - " открыто"
   $
]

#example[
  $C W$ комплексы $Delta$-порождены.
]

#definition[
  Определим функтор в $T o p$ для $Delta$-порожденных:
  $
    K(X) = c o l i m_([0,1]-->X)[0,1]
  $
]

#statement[
  + $forall X, space K(X)-->X$ -- биекция
  + $K(X)-->X$ -- гомеоморфизм $<==>space X$ -- $Delta$-порожден
  + {$Delta$-порожденные} $subset T o p$ -- корефлективная подкатегория
]

#statement[
  + {$Delta$-порожденные} -- локально представимая категория
  + {$Delta$-порожденные} -- декартово замкнутая категория (функтор умножения $(X times dot)$ имеет правый сопряженный)
]

#remark[
  Далее под $S p c$ будем понимать именно {$Delta$-порожденные}
]

#definition[
  *Слабой эквивалентностью* между пространствами $X,Y in "Spc"$ будем называть такое $f$, что такая диаграмма коммутативна:
  #align(center, diagram({
    node((-1, -1), [$S^(n-1)$])
    node((-1, 0), [$D^n$])
    node((0, -1), [$X$])
    node((0, 0), [$Y$])
    edge((-1, -1), (-1, 0), [$i n$], label-side: right, "->")
    edge((0, -1), (0, 0), [$f$], label-side: left, "->")
    edge((-1, 0), (0, 0), [$forall$], label-side: right, "->")
    edge((-1, -1), (0, -1), [$forall$], label-side: left, "->")
    edge((-1, 0), (0, -1), [$exists$], label-side: left, "-->")
  }))
]

#definition[
  *Категория со слабой эквивалентностью* это $(C,W)$ где $C$ -- категория, $W subset "Mor"(C)$, причем:
  + ${id_X, space X in C} subset W$
  + $W$ удовлетворяет свойству:$
                                 g f in W,h g in W ==> f,g,h in W 
                               $
]
#corollary[
  $"Iso"(C) subset W$
]

#example[
  $C-->^F D$ -- функтор, $W = {f, space F f - "iso"}$
]

#definition[
  $F:(C,W)-->(D,W)$ -- *гомотопический функтор*, если $F(W) subset W$
]

#definition[
  *Гомотопическая категория* $"Ho"(C)$ определяется следующим образом:
  + $"Ob"("Ho"(C)) = "Ob"(C) $
  + $"Hom"_("Ho"(C)) (X,Y) = {"пути с точностью до обращения стрелок из "W: space X ... -> -> <-_(in W) ->...Y}$
  При этом верны следующие аксиомы:
  $
    ->^f <-^f space tilde  space dot\
    <-^f ->^f space tilde  space dot\
    ->^f ->^g space tilde  space ->^(g f)\
    <-^g <-^f space tilde  space <-^(g f)\
  $
] 

#definition[
  *Инициальный гомомтопический функтор* $C -->^("Ho") "Ho"(C)$ -- такой функтор, что:
  $
    forall D - " категория": space "Fun"("Ho"(C),D) tilde.eq "Fun"(C,D)
  $ 
]

#v(1cm)

Возникает следующая проблема: копределы не инвариантны относительно слабой эквивалентности.

#definition[
  Пусть есть категории $A, B, C$ и функторы $X:A-->B, space F:A-->C$. *Правым расширением Кана* будем называть $"Ran"_X F: B--> C$ с естественным преобразованием $epsilon:("Ran"_X F) compose X ==> F$, что для любого функтора $G:B-->C$ и естественного преобразования $alpha:G compose X ==> F$ существует единственное преобразование $sigma:G ==> "Ran"_X F$, причем $alpha = epsilon compose (sigma X)$.
  
]

#definition[
  Пусть есть $(C,W), space (D,W), space F:C-->D$ -- функтор, рассмотрим композицию $F$ и Ho -- получим слелующую диаграмму: 
  #align(center, diagram({
    node((1, -1), [$C$])
    node((1, 0), [$"Ho"(C)$])
    node((2, -1), [$D$])
    node((-3, -2))
    node((2, 0), [$"Ho"(D)$])
    edge((1, -1), (1, 0), "->")
    edge((1, -1), (2, -1), [$F$], label-side: left, "->")
    edge((1, 0), (2, 0), "-->")
    edge((2, -1), (2, 0), "->")
  }))
  Её правым расширением Кана (если оно есть) будем называть $LL F$ -- *левый производный функтор*
]

#remark[$LL F: C--> D$ -- гомотопический функтор]

#definition[
  $(C,W), space (D,W), space F:C-->D$, "*кофибрантной заменой, приспособленной к $F$*" называется $Q:C-->C$:
  + $forall X in C: space q_X:Q(X)-->X in W$
  + $F$ сохраняет слабую эквивалентность между $"Im"(Q) = {Q X: space X in C}$
]

#statement[
  $LL F = F compose Q$
]

== Модельные категории.

#definition[
  $f,g in "Mor"$, будем говорить что $f perp g$, если следующая диаграмма коммутативна:
  #align(center, diagram({
    node((-3, -2))
    node((1, -1), [$bullet$])
    node((1, 0), [$bullet$])
    node((2, -1), [$bullet$])
    node((2, 0), [$bullet$])
    edge((1, -1), (1, 0), [$f$], label-side: right, "->")
    edge((2, -1), (2, 0), [$g$], label-side: left, "->")
    edge((1, 0), (2, 0), [$forall$], label-side: right, "->")
    edge((1, -1), (2, -1), [$forall$], label-side: left, "->")
    edge((1, 0), (2, -1), [$exists$], label-side: right, "->")
  }))
  Для $A subset "Mor"(C)$:
  $
    A^L = {f: space f perp a, space forall a in A} - "левый ортогонал"\
    A^R = {f: space a perp f, space forall a in A} - " правый ортогонал"
  $
]

#statement[
  $A^(L R L) = A^L, space A^(R L R) = A^R$
]

#definition[
  *Система факторизации на $C$* -- функтор, раскладывающий стрелку в произведение двух.
]

#definition[
  *Слабо ортогональная система факторизации на $C$* -- система факторизации, раскладывающая стрелку в произведение ортогональных. 
]

#definition[
  Пусть есть $(M,W)$. *Модельной структурой* будем называть совокупность:
  + $C subset "Mor"(M)$ -- *кофибрации*
  + $F subset "Mor"(M)$ -- *фибрации*
  А также две слабо ортогональные системы факторизации:
  + $(C inter W, F)$
  + $(C, F inter W)$
  $C inter W$ называются *тривиальной кофибрацией (фибрацией)*
]

#definition[
  *Модельной категорией* называется биполная (замкнута относительно всех пределов) категория $(C,W)$ со слабой эквивалентностью и модельной структурой. 
]

#statement[
  Пусть $(C,W)$ биполна, $"Ho":C --> "Ho"(C)$, если её можно оснастить модельной структурой, то $W = "Ho"^(-1) 
  ("iso")$
]

#example[
  $("Spc",W)$ -- модельная структура Квиллена-Серра:
  $
    "fib" = {D^n --> D^n times I}^R, space n>=0\
    "cof" = ("fib"inter W)^L
  $
]

#definition[
  $X in M$ называется *кофибрацией*, если $0-->X in"cof"$.\
  Соответственно $X$ называется *кофибрацией*, если $X-->1 in "cof"$
]

#example[
  в Spc:
  + все $X$ кофибрантны
  + $C W subset "cof"$
]

#definition[
  *Фибрантная/кофибрантная замена $X$* -- такой фибрантный/ кофибрантный объект вместе со стрелкой:
  #align(center, diagram({
    node((-3, -2))
    node((0, 0), [$X_"fib"$])
    node((1, -1), [$X$])
    node((2, 0), [$X_"cof"$])
    edge((0, 0), (1, -1), [$in W$], label-side: left, "->")
    edge((1, -1), (2, 0), [$in W$], label-side: left, "->")
  }))
]

#v(1cm)

Гомотопию между отображениями можно мыслить в произвольной категории. Для этого обобщим определение цилиндра и пути:
#definition[
  Пусть $M$ -- модельная категория, тогда *циллиндрическим* объектом будем называть следующее разложение стрелки $"Cyl"(X)$:
  #align(center, diagram({
    node((-3, -2))
    node((0, 0), [$X union.sq X$])
    node((1, 0), [$"Cyl"(X)$])
    node((2, 0), [$X$])
    edge((0, 0), (1, 0), [$"cof"$], label-side: left, "->")
    edge((1, 0), (2, 0), [$w$], label-side: left, "->")
    edge((0, 0), (2, 0), [$D$], label-side: right, "->", bend: -36deg)
  }))
  аналогично определим объект $"Path"(X)$:
  #align(center, diagram({
    node((-3, -2))
    node((0, 0), [$X times X$])
    node((1, 0), [$"Path"(X)$])
    node((2, 0), [$X $])
    edge((1, 0), (0, 0), [$"fib"$], label-side: right, "->")
    edge((2, 0), (1, 0), [$w$], label-side: right, "->")
    edge((2, 0), (0, 0), [$D$], label-side: left, "->", bend: 36deg)
  }))
  Соответственно $f tilde.eq_L g$ и $f tilde.eq_R g$ -- *гомотопны*, если коммутативны следующие диаграммы:
  #align(center, diagram({
    node((-3, -2))
    node((1, 0), [$"Cyl"(X)$])
    node((2, 0), [$Y$])
    node((1, 1), [$X union.sq X$])
    edge((1, 0), (2, 0), [$H$], label-side: left, "->")
    edge((1, 1), (1, 0), [cof], label-side: left, "->")
    edge((1, 1), (2, 0), [$f union.sq g$], label-side: right, "->")
  }))
  #align(center, diagram({
    node((-3, -2))
    node((1, 0), [$X$])
    node((2, 1), [$Y times Y$])
    node((2, 0), [$"Path"(Y)$])
    edge((1, 0), (2, 1), [$f times g$], label-side: right, "->")
    edge((1, 0), (2, 0), [$hat(H)$], label-side: left, "->")
    edge((2, 0), (2, 1), [$"fib"$], label-side: left, "->")
  }))
]

#statement[
  $X$ -- кофибрантно, $Y$ -- фибрантно $==>$ $tilde.eq_L $ и $tilde.eq_R$ совпадают на $"Hom"(X,Y)$ 
]

#theorem[
Пусть $M$ -- модельная категория, тогда $"Ho"(M) = M_"cf" slash_tilde.eq$ где $M_"cf"$ -- пересечение фибрантных и кофибрантных.  
]
