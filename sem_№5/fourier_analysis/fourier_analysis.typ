#import "@preview/great-theorems:0.1.2": *
#import "@preview/fletcher:0.5.8": *

#set document(
    title: "Конспект по анализу Фурье",
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
    #text(18pt)[Лектор: Белов Юрий Сергеевич]
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

#lecture("07.09.2026")

== Анализ Фурье на отрезке.

Рассмотрим гильбертово пространство $L^2[-pi,pi]$ с скалярным произведением:
$
  (f,g) = 1/(2pi) integral_(-pi)^pi f(x) overline(g) (x) d x
$
Из предыдущих семестров знаем (например по теореме Стоуна Вейштрасса и полноте непрерывных в суммируемых), что в нём существует ортонормированный базис ${e^(i n t)}_(n in ZZ)$. Тогда любую функцию можем представить в виде ряда:
$
  f(t) = sum_(n in ZZ) c_n e^(i n t)
$

#definition[
  Коэфиценты в этом разложении будем называть *коэфицентами Фурье*, вспомним из курса комплана как они считаются:
  $
    hat(f(n)) = c_n = 1/(2 pi)integral_(-pi)^pi f(x) e^(-i n t) d x
  $
]


Рассмотрим окружность $TT = {z in CC : |z| = 1} subset CC$, функция $f$ аналитична в окружности:\
$
  f(z) = sum_(n in ZZ) a_n z^n, space a_n in CC, space  z in TT
$
Аналитично продолжить мы её можем только если $a_n$ достаточно быстро убывают при $|n| --> oo$

#v(1cm)

Снова рассмотрим $L^2[-pi,pi], space RR$, заметим что ${1,cos n t, sin n t}_(n in NN)$ -- ортонормированный базис (очевидно из разложения $sin, cos$ через экспоненту), причем разложение будем записывать так:
$
  f(t) = a_0/2 + sum_(n=1)^oo (a_n cos n t + b_n sin n t)
$

Соответствующим коэфицентам $a_n, b_n$ можно приписать физический смысл -- это амплитуда и частота колебаний с частотой $n$:
$
  a_n = 1/pi integral_(-pi)^pi f(t) cos (n t) d t, space b_n = 1/pi integral_(-pi)^pi f(t) sin (n t) d t
$
Эти формулы работают, так как $cos n t, space sin n t$ убивают все другие частоты при домножении на $f(t)$ и интегрировании.\

#v(1cm)

Рассмотрим теперь пространство $L^2(-l,l)$. Тогда разложение Фурье будет иметь вид:
$
  f(t) = sum_(n in ZZ) a_n cos((pi n t)/l) + b_n sin((pi n t)/l)
$
Причем норма функции будет вычисляться по формуле:
$
  ||f||^2 = l (|a_0|^2 + sum_(n=1)^oo (|a_n|^2 + |b_n|^2))
$
А сами коэфиценты:
$
  a_n = 1/l integral_(-l)^l f(t) cos((pi n t)/l) d t, space b_n = 1/l integral_(-l)^l f(t) sin((pi n t)/l) d t
$

Теперь рассмотрим уже функцию $f in L^1(RR)$, запишем пока формулы преобразования и обратного преобразования, чисто формально, без доказательств:
$
  hat(f)(omega) = integral_RR f(t) e^(- i omega t) d t\
  f(t) = C integral_RR hat(f)(omega) e^(i omega t) d omega
$

== Связь роста коэфицентов Фурье с гладкостью.

Интуитивно, хотим строго сформулировать соображение о том, что гладкость функции $f in L^1[-pi,pi]$ эквивалентна быстрому убыванию её коэфицентов Фурье.\
Ещё раз посмотрим на формулу $hat(f)$ и попробуем оценить её модуль:
$
  |hat(f)(n)| = |integral_(-pi)^pi f(t) e^(- i n t) d t|<= integral_(-pi)^pi |f(t)| d t = ||f||_1
$
Пусть $f in C^1[-pi,pi]$:
$
  hat(f)(n) = 1/(2 pi) integral_(-pi)^pi f(t) e^(- i n t) d t = (-1)/(2 pi i n) integral_(-pi)^pi f(t)  d (e^(- i n t)) = (-1)/(2 pi i n) (f(t) e^(- i n t)|_(-pi)^pi - integral_(-pi)^pi f'(t) e^(- i n t) d t)  = 1/(i n) hat(f')(n)
$
Ну а тогда делается вывод $|hat(f)(n)| <= C/(|n|)$ для некоторой константы $C$. Аналогично, можно сформулировать следующее:

#statement[
  Пусть $f in C^k$, тогда $|hat(f)(n)|<=C/(|n|^k)$, для некоторой константы $C$
]

Однако мы можем ослабить условие гладкости до условия конечности вариации:
$
  V a r(f) = sup_(P) sum_(i=0)^n |f(x_(i+1)) - f(x_i)|<oo, " где "P - "разбиение отрезка" [-pi,pi]
$
#statement[
  Для функций конечной вариации верно: $|hat(f)(n)| <= C/(|n|)$, для некоторой константы $C$
]
#proof[
  $
    2hat(f)(n) = integral_(-pi)^pi f(t) e^(- i n t) d t - integral_(-pi)^pi f(t) e^(- i n (t-pi/n)) d t = integral_(-pi)^pi f(t) e^(- i n t) d t - integral_(-pi-pi/n)^(pi-pi/n) f(t+pi/n) e^(- i n t) d t =\ = integral_(-pi)^pi (f(t)-f(t+pi/n)) e^(- i n t) d t + M
  $
  Где $M$ убывает как $C/(|n|)$. Остаётся оценить интеграл. Разобъём его на мелкие промежутки и оценим пользуясь конечной вариацией:
  $
    2|hat(f)(n)|<=|sum_(k=0)^(2n-1)1/(2pi)integral_(-pi+(k n)/pi)^(-pi+((k+1)pi)/n) (f(t)-f(t+pi/n)) e^(- i n t) d t|<=\ <=integral_(-pi)^(-pi+pi/n) sum_(k=0)^(2n-1)1/(2pi) |(f(t+(k n)/pi)-f(t+((k+1)pi)/n)) e^(- i n t)| d t<= pi/(|n|)V a r(f)
  $
]
