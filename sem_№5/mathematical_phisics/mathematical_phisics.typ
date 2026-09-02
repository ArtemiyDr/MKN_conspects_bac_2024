#import "@preview/great-theorems:0.1.2": *
#import "@preview/fletcher:0.5.8": *

#set document(
    title: "Конспект по математической физике",
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
    #text(18pt)[Лектор: Жеданов Алексей Сергеевич]
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

#align(center)[#text(size: 20pt)[= Введение.]]

#lecture("02.09.2026")

== Базовые уравнения.

В первую очередь математическая физика занимается изучением определенных дифференциальных уравнений, наиболее часто встречающихся в различных областях физики.\
Приведём несколько самых распространенных примеров, физическую интуицию для них дадим позже:
+ Уравннение Лапласса (элиптическое):$
  Delta F(arrow(r)) = 0," где "Delta = sum_(i=1)^N partial^2_x_i
$ 

+ Уравнение Деламбера (гиперболическое):$
  square F(arrow(r),t) = 0," где "square = Delta - 1/c^2 partial^2_t, " причем "c - "константа" 
$

+ Уравнение теплопроводности (Параболическое):$
  (partial F(arrow(r),t))/(partial t) - A dot Delta F(arrow(r),t) = 0, " где "A - "константа" 
$

+ Уравнение Шрёдингера (Параболическое):$
  i (partial psi(arrow(r),t))/(partial t) = Delta psi(arrow(r),t), " где "phi" называется волновой функцией"
$

#pagebreak()

== Гильбертовы пространства.
Немного расскажем о том, в каких пространтсвах в дальнейшем будем работать. Нам хорошо подходят гильбертовы пространства $L_2,l_2$ из курса функана. Вспомним определения:
#definition[
  Пространство $L_2$ состоит из измеримых функций $f$, что следующий интеграл конечен:
  $
    integral_RR |f(x)|^2 d x
  $
  Также это пространство является *гильбертовым*, то есть реализует скалярное произведение:
  $
    (f,g) = integral_RR f(x) overline(g(x)) f d x
  $
]
#remark[
  На $L_2$ можно определить норму через скалярное произведение:
  $
    ||f||^2 = (f,f)
  $
  И соответственно выполнено неравенство КБШ:
  $
    |(f,g)|<=||f|| dot ||g||
  $
]

#definition[
  *Ортонормированной системой* будем называть систему $e_0,e_1,...$, что:
  + $(e_i,e_j) = delta_(i j)$
  + $||e_i|| = 1$
]
#remark[
  К сожалению мы не можем выразить все функции через линейные комбинации такой сичстемы, однако существует приближение в виде неравенства Бесселя:
  $
    sum_(i=0)^oo |(f,e_i)|^2<=||f||^2
  $
  Из курса функана вспомним, что ортонормированная система тогда и только тогда является *базисом*, когда неравенство Бесселя для каждой функции обращается равенством, такое равенство называется равенстом Парсиваля.
]

#v(1cm)

Теперь перейдем к второму пространству $l_2$:
#definition[
  $l_2$ состоит из бесконечных последовательностей $(a_0,a_1,...)$, таких что следующая сумма конечна:
  $
    sum_(i=0)^oo a_i^2
  $
  Оно также является гильбертовым с очевидным образом определенным скалярным произведением:
  $
    ((a_0,a_1,...), (b_0,b_1,...)) = a_0 b_0 + a_1 b_1 +...
  $
]

Аналогично в $l_2$ определяется ортонормированная система, причем существует базис:
$
  e_0 = (1,0,0,...)\
  e_1 = (0,1,0,...)\
  e_2 = (0,0,1,...)\
  ...
$

#example[
  Рассмотрим следующий набор в $L_2: space (1,x,x^2,...)$  -- он очевидно не является ортонормированным. Ортонормируем его Граммом-Шмидтом и получим ортонормированную систему полиномов:
  $
    P_n (x) = sum_(k=0)^n A_(n k) x^k
  $
  Это *полиномы Лежандра*
]

#pagebreak()

#align(center)[#text(size: 20pt)[= Обобщённые функции.]]

== Основные определения.

Рассмотрим конечномерное векторное пространство, в нем существет ортонормированный базис из $n$ элементов $(e_1,...,e_n)$, тогда скалярное произведение можно записать через этот базис в виде конечой суммы:
$
  a = a_1 e_1 +...+a_n e_n, space b = b_1 e_1 +...+ b_n e_n \
  (a,b) = a_1 b_1 + a_n b_n
$
Идея Дирака заключалась в обобщении такого представленяи скалярного произведения на гильбертовы пространства. Для этого он ввел функцию:
$
  delta(x) = cases(oo"," space x = 0, 0"," space x eq.not 0)
$
Но как функция может принимать бесокнечное значение? Для этого вводится особая структура:
#definition[
  *Основное пространство* $K$ - пространство всех функций $phi:RR->RR, space phi in C^oo, space phi(x)eq.triple 0$ вне какого-то промежутка $[a,b]$
]
