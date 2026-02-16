#import "@preview/great-theorems:0.1.2": *
#import "@preview/fletcher:0.5.8": *

#set document(
    title: "Конспект по алгебре",
)
#set page("a4")
#set page(margin: 1.5cm)
#set text(12pt)
#set par(justify: true)
#set heading(numbering: "1.")

#show: great-theorems-init

#let theorem = mathblock(
    blocktitle: "Теорема",
    counter: none,
    fill: color.linear-rgb(100%, 63.76%, 63.76%), 
    inset: 10pt,
    radius: 5pt,
)

#let lemma = mathblock(
    blocktitle: "Лемма",
    counter: none,
    fill: oklab(95.23%, -0.068, 0.032),
    inset: 10pt,
)

#let proposition = mathblock(
    blocktitle: "Предложение",
    counter: none,
    fill: oklch(91.23%, 0.103, 128.85deg),
    inset: 10pt,
)

#let definition = mathblock(
    blocktitle: "Определение",
    counter: none, 
    fill: blue.lighten(80%),
    inset: 10pt,
    radius: 5pt,
)

#let remark = mathblock(
    blocktitle: "Замечание",
    counter: none, 
    fill: oklch(83.83%, 0.012, 264.5deg),
    inset: 10pt,
    radius: 5pt,
)

#let example = mathblock(
    blocktitle: "Пример",
    counter: none, 
    fill: oklch(87.86%, 0.121, 129.16deg),
    inset: 10pt,
    radius: 5pt,
)

#let problemCounter = counter("problem")

#let problem = mathblock(
    blocktitle: "Задача",
    counter: problemCounter, 
    fill: oklch(87.86%, 0.121, 129.16deg),
    inset: 10pt,
    radius: 5pt,
)

#let proof = proofblock(prefix: [_Доказательство_:#h(1cm)], suffix: [#h(1fr) $square$])

#let lecture(date) =[
  #text(16pt, weight: "bold")[Лекция от #date]
  #line(length: 40%, stroke: 0.5pt)
  #v(1em)
]

#align(center + horizon)[
    #show title: set text(size: 24pt, weight: "bold")
    #title()
    #v(1.5em)
    #text(18pt)[Лектор: Сивацкий Александр Станиславович]
    #v(1.5em)
    #text(18pt)[Автор: Артемий Дружинин]
    #v(1em)
    #text(14pt)[Факультет МКН СПБГУ]
    #v(1em)
    #text(12pt)[Весенний семестр 2026]
]

#pagebreak()

#align(center)[= Теория представлений конечных групп.]
#v(2em)

#lecture("11.02.2026")

Вспомним несколько важных определений и теорем из предыдущего семестра:

#theorem[(Машке) 
    Пусть $k$ - поле, $G$ - конечная группа, $"char" k divides.not |G|$, $V$ - $k[G]$-модуль, 
    тогда найдется подмодуль $U$, такой что $V = U plus.o W$ для некоторого подмодуля $W$.
]

#definition[
    *Неприводимый $G$-модуль* - простой $k[G]$-модуль.
 ]

#definition[
    Модуль называется *неразложимым*, если он не является прямой суммой двух ненулевых подмодулей.
]

Везде далее $V$ - конечномерное векторное пространство над полем $k$ и $"char" k divides.not |G|$

Хотим доказать, что разложение в прямую сумму неприводимых существует и единственно, существование очевидно из леммы Машке, а единственность - из следующей леммы.

#lemma[ (Шура) 
    Пусть $M,N$ - простые модули над кольцом $R$
    + $forall "гомоморфизм" phi: M arrow N$ либо изоморфизм либо нулевой.
    + $"End"_R (M)$ - тело (т.е. кольцо с делением).
] 
#proof[
    + Пусть $phi$ не изоморфизм, тогда $"ker"(phi) " - модуль," eq.not {0}$, так как $M$ простой, то $"ker"(phi) = M$, значит $phi$ - нулевой гомоморфизм. \ Если же $phi$ не нулевой, то $"Im"(phi) eq.not {0}$, значит $"Im"(phi) = N$, значит $phi$ - эпиморфизм, а так как $M$ простой, то $"ker"(phi) = {0}$, значит $phi$ - изоморфизм.\
    + Действительно, любой ненулевой элемент - изоморфизм, а значит обратим.
]

#theorem[
Пусть $V$ - приводимый модуль над $G$, 
тогда $V$ можно разложить на прямую сумму неприводимых над $G$:
$
  V = V_1 plus.o V_2 ... plus.o V_n
$
Такое разложение единственно до перестановок и изоморфности отдельных модулей.
]
#proof[
    Пусть есть два различных разложения: 
    $
      V tilde.eq M_1^r_1 plus.o M_2^r_2 ... plus.o M_k^r_k " и " V tilde.eq N_1^s_1 plus.o N_2^s_2 ... plus.o N_l^s_l
    $
    Пусть $M_i tilde.eq.not N_j$ для любого $j$. Тогда гомоморфизм $phi_j$, определенный как композиция вложения и проекции (на диаграмме), по лемме Шура тривиален.
    $
    #align(center, diagram({
    node((-2, 0), [$M_i^r_i$])
	node((0, 0), [$⨁N_t^s_t$])
	node((2, 0), [$N_j^s_j$])
	node((0, 1))
	edge((-2, 0), (0, 0), [$i n$], label-side: left, "->")
	edge((0, 0), (2, 0), [$p r_j$], label-side: left, "->")
	edge((-2, 0), (2, 0), [$phi_j$], label-side: left, "->", bend: -36deg)
    }))
    $
    Поймем, что через эти гомоморфизмы можно разложить вложение $M_i^r_i$ в $V=⨁N_t^s_t$, что в композиции с проекцией на себя дает $id_M_i^r_i eq.triple 0$, то есть $M_i^r_i$ - тривиальный модуль, что невозможно.
    $
    #align(center, diagram({
	node((-2, 0), [$M_i^r_i$])
	node((0, 0), [$⨁N_t^s_t$])
	node((2, 0), [$M_i^r_i$])
	edge((-2, 0), (0, 0), [$⨁phi_t$], label-side: left, "->")
	edge((0, 0), (2, 0), [$p r_i$], label-side: left, "->")
    }))
    $
    
    Поэтому $M_i$ изоморфен одному из $N_j$. Удалив эти модули, получаем два разложения для $V$ с меньшим количеством неприводимых, и так далее.    
]

#definition[
    $R$ - кольцо, $U$ - векторное пространство над полем $K$, причем 
    $
    lambda(x y)=(lambda x)y = x(lambda y), forall x, y in R, lambda in K
    $
    Тогда $R$ называется *$K$-алгеброй*
]

#proposition[
    Пусть $L$ - простой идеал $R$, $M$ - простой модуль над $R$\
    Тогда если $L tilde.eq.not M$ то $L M = 0$
]
#proof[
    Пусть $m in M$, проверим что $L m = 0$: \
    Рассмотрим гомоморфзим $phi: L arrow M, space phi(l) = l m$ - он нулевой по лемме Шура
]

#remark[
    $k[G]$ - $k$-алгебра и $R$-модуль, тогда
    $
      R = k[G] = L_1^r_1 plus.o L_2^r_2 ... plus.o L_m^r_m, space L_i - "простые неизоморфные идеалы"
    $
    По предложению $L_i^r_i L_j^r_j = L_i L_j = 0$
]
$
  "Пусть" 1 = e_1 + e_2 + ... + e_m, space e_i in L_i^r_i, space e_i e_j = 0, "при" i eq.not j
$
$
  e_i^2 = e_i (e_i + sum_limits(j eq.not i)e_j) = e_i dot 1 = e_i
$ 
То есть $e_i$ - *идемпотент*.  Кроме того, очевидно, что $e_i$ - центральный элемент, так как $e_i e_j = 0$ при $i eq.not j$, а значит $e_i$ коммутирует с любым элементом.\
Если $a_1e_1+...+a_m e_m = 0$, то $a_i = 0$ для всех $i$, значит $m lt.eq dim_k Z(k[G])$.\
#theorem[
    Любой простой $G$-модуль изоморфен какому-то идеалу $L_i$
]
#proof[
    Для какого-то $i, space L_i M eq.not 0$, значит они изоморфны по предложению, так как $L_i$ - простой идеал, а $M$ - простой модуль
]

Для $g in G$ рассмотрим $K_g = {h g h^-1, h in G}$ (класс сопряженностим). Обозначим $hat(K)_g = sum_limits(b in K_g)b$

#theorem[
    ${hat(K)_g}_limits(g in I)$ составляют базис $Z(k[G])$, где $I$ - множество представителей классов сопряженности в $G$.
]
#proof[
    Очевидно, что $hat(K)_g$ - центральный элемент, так как он коммутирует с любым элементом $h in G$, так как $h hat(K)_g h^(-1) = hat(K)_g$.\
    Пусть $z in Z(k[G])$, тогда $z = sum_limits(g in G) a_g g = sum_limits(g in G) a_g tau g tau^(-1)$ для любого $tau in G$. \
    Значит $a_g = a_(tau g tau^(-1))$. Поймем, что для элементов из одного класса $K_g$ константы $a_g$ будут одинаковыми, поэтому сумма преобразуется в линейную комбинацию $hat(K)_g$ для $g in I$.\ 
    Наконец, докажем линейную независимость: фиксируем класс сопряженности $K_h$, любой элемент $x in K_h$
    содержится в $a_h hat(K)_h$ единственным образом и не содержится в $a_g hat(K)_g$ для $g eq.not h$, значит $x$ содержится в линейной комбинации $sum_limits(g in I) a_g hat(K)_g$ единственным образом, значит если эта линейная комбинация нулевая, то $a_g = 0 space forall g in I$, так как элементы $G$ - базис $k[G]$.    
]
