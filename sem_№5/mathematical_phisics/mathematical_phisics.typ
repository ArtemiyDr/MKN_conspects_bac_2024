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
#lecture("16.09.2026")

== Пространство основных функций.

Для записи частных производных введём мультииндекс $alpha=(alpha_1,...,alpha_n) in NN^n$ и обозначим:
$
  |alpha| = sum_(k=1)^n alpha_k, quad
  D^alpha phi = (partial^(|alpha|) phi)/(partial x_1^(alpha_1) ... partial x_n^(alpha_n)).
$

#definition[
  *Пространством основных функций* $D(RR^n)$ назовём пространство бесконечно дифференцируемых функций с компактным носителем в $RR^n$.

  Последовательность $(phi_j)$ сходится к $phi$ в $D(RR^n)$, если существует компакт $K subset RR^n$, содержащий носители всех $phi_j$ и $phi$, и для каждого мультииндекса $alpha$ производные $D^alpha phi_j$ равномерно сходятся к $D^alpha phi$ на $K$.
]

#remark[
  Пространство $D(RR^n)$ с этой топологией является топологическим векторным пространством и не является метризуемым.
]

#definition[
  *Пространством обобщённых функций* $D'(RR^n)$ назовём пространство непрерывных линейных функционалов на $D(RR^n)$. Элементы $D'(RR^n)$ будем называть обобщёнными функциями или распределениями, а действие распределения $T$ на основную функцию $phi$ обозначать $(T,phi)$.
]

#example[
  Пусть $f in L_"loc"^1 (RR^n)$. Тогда формула
  $
    (T_f,phi) = integral_(RR^n) f(x) phi(x) d x
  $
  задаёт обобщённую функцию $T_f$. Такие распределения называются *регулярными*; остальные распределения называются *сингулярными*.
]

#v(1cm)

#example[
  *Дельта-распределение* $delta_0$ определяется равенством
  $
    (delta_0,phi) = phi(0).
  $
  Запись $delta_0$ как функции, равной нулю вне нуля и бесконечной в нуле, — лишь физическая интуиция, а не строгое определение.

  В одномерном случае примером сингулярного распределения также служит главное значение $1/x$:
  $
    ("v.p." 1/x,phi) = lim_(epsilon arrow.r 0) integral_(|x|>epsilon) phi(x)/x d x.
  $
]

#theorem[(Сохоцкого — Племеля)
  В пространстве $D'(RR)$ справедливы пределы
  $
    lim_(epsilon arrow.r 0) 1/(x + i epsilon) = "v.p." 1/x - i pi delta_0,
    quad
    lim_(epsilon arrow.r 0) 1/(x - i epsilon) = "v.p." 1/x + i pi delta_0.
  $
]

#definition[
  *Носителем* распределения $T in D'(RR^n)$ назовём дополнение к наибольшему открытому множеству, на котором $T$ обращается в нуль. Иными словами,
  $
    "supp" T = RR^n ∖ G_T,
  $
  где $G_T$ — объединение всех открытых множеств $G$, для которых $(T,phi)=0$ для каждой $phi in D(G)$.
]

#definition[
  Пусть $T in D'(RR^n)$ и $beta in C^oo (RR^n)$. *Произведение распределения на гладкую функцию* $beta T$ определим равенством
  $
    (beta T,phi) := (T,beta phi).
  $
]

#definition[
  Пусть $T in D'(RR^n)$ и $alpha in NN^n$. *Производную распределения* $T$ определим формулой
  $
    (D^alpha T,phi) := (-1)^(|alpha|) (T,D^alpha phi).
  $
]

#example[
  Рассмотрим функцию *Хевисайда* $theta(x)=1$ при $x>0$ и $theta(x)=0$ при $x<0$, понимаемую как регулярное распределение. Тогда по определению производной
  $
    (D theta,phi) = - integral_0^oo phi'(x) d x = phi(0) = (delta_0,phi),
  $
  то есть $D theta = delta_0$.
]

#block(breakable: false)[
  #definition[
    Последовательность распределений $T_j$ *сходится к* $T$ в *слабой звёздной топологии*, если
    $
      (T_j,phi) -> (T,phi) quad "для каждой" phi in D(RR^n).
    $
  ]

  #theorem[
    Пусть $T_j in D'(RR^n)$ и для каждой $phi in D(RR^n)$ существует конечный предел $(T_j,phi)$. Тогда функционал
    $
      (T,phi) := lim_(j->oo) (T_j,phi)
    $
    задаёт обобщённую функцию $T in D'(RR^n)$.
  ]
]

#v(1cm)


#lecture("23.09.2026")

== Тензорное произведение и свёртка.

#definition[
  Пусть $T in D'(RR^n)$, $S in D'(RR^m)$ и $Phi in D(RR^(n+m))$. *Тензорное произведение* $T times.o S$ определяется равенством
  $
    (T times.o S,Phi) := (T_x,(S_y,Phi(x,y))).
  $
  При фиксированном $x$ внутреннее действие задаёт основную функцию от $x$, к которой применяется $T$.
]

#remark[
  Тензорное произведение распределений коммутирует с перестановкой переменных. В частности, произведение $T times.o S$ определено для любых $T$ и $S$ из соответствующих пространств распределений.
]

Сначала напомним свёртку основных функций $phi,psi in D(RR^n)$:
$
  (phi * psi)(x) = integral_(RR^n) phi(x-y) psi(y) d y.
$
Она принадлежит $D(RR^n)$, причём для любого мультииндекса $alpha$:
$
  D^alpha (phi * psi) = (D^alpha phi)*psi = phi*(D^alpha psi).
$

#v(1cm)

#definition[
  Пусть $T in D'(RR^n)$ и $phi in D(RR^n)$. Их *свёртку* определим формулой
  $
    (T*phi)(x) := (T_y,phi(x-y)), " где "T_y" действует по "y.
  $
]

#theorem[
  Если $T in D'(RR^n)$ и $phi in D(RR^n)$, то $T*phi in C^oo (RR^n)$ и
  $
    D^alpha (T*phi) = (D^alpha T)*phi = T*(D^alpha phi).
  $
]

#proof[
  Гладкость и равенства следуют из определения свёртки и сходимости разностных отношений основных функций в $D(RR^n)$.
]

#remark[
  В частности, $delta_0*phi=phi$.
]

#definition[
  *Свёртку двух произвольных распределений* $T,S in D'(RR^n)$ можно определить, если существует предел, не зависящий от выбора последовательности срезающих функций $eta_k in D(RR^(2n))$, для которой $eta_k=1$ на шарах $B_(R_k) (0)$, $R_k -> oo$, а все производные $eta_k$ равномерно ограничены.

  Если для каждой $phi in D(RR^n)$ существует такой предел, то полагают
  $
    (T*S,phi) := lim_(k->oo) (T times.o S, eta_k (x,y) phi(x+y)).
  $
]

#remark[
  Если одно из распределений имеет компактный носитель, их свёртка определена. Для регулярных распределений, заданных функциями $f,g in L^1 (RR^n)$, свёртка совпадает с обычной:
  $
    (f*g)(x) = integral_(RR^n) f(x-y)g(y) d y.
  $
  Когда все рассматриваемые свёртки определены, выполняются свойства
  $
    T*S = S*T, quad D^alpha (T*S) = (D^alpha T)*S = T*(D^alpha S).
  $
]
