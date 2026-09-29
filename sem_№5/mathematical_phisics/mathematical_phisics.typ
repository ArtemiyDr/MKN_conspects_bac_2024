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

В первую очередь математическая физика занимается изучением дифференциальных уравнений, наиболее часто встречающихся в различных областях физики.\
Приведём несколько распространённых примеров; физическую интуицию для них обсудим позже:
+ Уравнение Лапласа (эллиптическое):$
  Delta F(arrow(r)) = 0," где "Delta = sum_(i=1)^N partial^2_x_i
$ 

+ Уравнение Гельмгольца:$
  Delta F(arrow(r)) = kappa F(arrow(r)), " где "kappa " — константа"
$

+ Уравнение Даламбера (гиперболическое):$
  square F(arrow(r),t) = 0," где "square = Delta - 1/c^2 partial^2_t, " причём "c - "константа"
$

+ Уравнение теплопроводности (параболическое):$
  (partial F(arrow(r),t))/(partial t) - A dot Delta F(arrow(r),t) = 0, " где "A - "константа" 
$

+ Уравнение Шрёдингера:$
  i (partial psi(arrow(r),t))/(partial t) = Delta psi(arrow(r),t), " где "psi" называется волновой функцией"
$

В качестве ещё одного примера приведём два уравнения Максвелла для электрического поля $E$ и магнитного поля $H$:
$
  nabla dot arrow(E) = 4 pi rho, quad nabla dot arrow(H) = 0,
$
где $rho$ — плотность электрического заряда.

== Гильбертовы пространства.
Немного расскажем о том, в каких пространствах будем работать в дальнейшем. Нам хорошо подходят гильбертовы пространства $L_2$ и $l_2$ из курса функционального анализа. Вспомним определения:
#definition[
  Пространство $L_2$ состоит из измеримых функций $f$, для которых конечен следующий интеграл:
  $
    integral_RR |f(x)|^2 d x
  $
  Также это пространство является *гильбертовым*, то есть в нём задано скалярное произведение:
  $
    (f,g) = integral_RR f(x) overline(g(x)) d x
  $
]
#remark[
  В $L_2$ норму можно определить через скалярное произведение:
  $
    ||f||^2 = (f,f)
  $
  Соответственно, выполнено неравенство КБШ:
  $
    |(f,g)|<=||f|| dot ||g||
  $
]

#definition[
  *Ортонормированной системой* будем называть систему $e_0,e_1,...$, для которой:
  + $(e_i,e_j) = delta_(i j)$
  + $||e_i|| = 1$
]
#remark[
  К сожалению, произвольную функцию не всегда можно выразить через линейные комбинации элементов такой системы. Однако для коэффициентов разложения справедливо неравенство Бесселя:
  $
    sum_(i=0)^oo |(f,e_i)|^2<=||f||^2
  $
  Из курса функционального анализа вспомним, что ортонормированная система является *базисом* тогда и только тогда, когда неравенство Бесселя для каждой функции обращается в равенство. Это равенство называется равенством Парсеваля.
]

#v(1cm)

Теперь перейдём к рассмотрению второго пространства — $l_2$:
#definition[
  $l_2$ состоит из бесконечных последовательностей $(a_0,a_1,...)$, для которых следующая сумма конечна:
  $
    sum_(i=0)^oo a_i^2
  $
  Оно также является гильбертовым пространством с очевидным скалярным произведением:
  $
    ((a_0,a_1,...), (b_0,b_1,...)) = a_0 b_0 + a_1 b_1 +...
  $
]

Аналогично в $l_2$ определяется ортонормированная система, причём существует базис:
$
  e_0 = (1,0,0,...)\
  e_1 = (0,1,0,...)\
  e_2 = (0,0,1,...)\
  ...
$

#example[
  Рассмотрим следующий набор в $L_2 ([-1,1]): space (1,x,x^2,...)$ — очевидно, он не является ортонормированным. Применив к нему метод Грамма — Шмидта, получим ортонормированную систему многочленов:
  $
    P_n (x) = sum_(k=0)^n A_(n k) x^k
  $
  Это *многочлены Лежандра*.
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
