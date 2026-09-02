#import "@preview/great-theorems:0.1.2": *
#import "@preview/fletcher:0.5.8": *

#set document(
    title: "Конспект по теории вероятности",
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
    #text(18pt)[Лектор: Лившиц Михаил Анатольевич]
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
#align(center)[#text(size: 20pt)[= Общая теория вероятности.]]

#lecture("01.09.2026")

== Основные определения.

$Omega$ - конечное или счетное множество, $omega in Omega, space p(omega)$ - вероятность, причем:
$
  sum_(omega in Omega) p(omega) = 1
$
А также определим 
$
  PP(A) = sum_(omega in A) p(omega), space A subset Omega 
$

К сожалению в ДТВ мы не умеем выбирать случайные величины на отрезках или на прочих несчетных конструкциях.\
Поэтому хотим обобщить теорию вероятности для несчетных множеств:

#definition[
  $(Omega, cal(A), PP)$ - *вероятностное пространство*, где 
  + $cal(A)$ -- $sigma$-алгебра на $Omega$
  + $PP$ -- единичная мера на $cal(A)$
  Элементы $A in cal(A)$ будем называть собятиями. 
]

#remark[
  Верны следующие свойства:
  $
  PP (union.sq.big_j A_j) = union.sq.big_j PP(A_j)\
  PP(A)+PP(overline(A))=1\
  PP(overline(A)) = 1 - PP(A)
  $
]

#definition[
  Аналогично определим и *условную вероятность*: $
  PP(A|B) = PP(A B)/PP(B)
  $
]
#remark[
  Работает также и формула полной вероятности:
  $
    PP(A) = sum_j PP(A|H_j)PP(H_j), space union.sq.big_j H_j = Omega
  $
]

#definition[
  $A,B$ -- *независимы*, если 
  $
    PP(A B)= PP(A)PP(B)
  $
  Пусть $cal(A)_1,...,cal(A)_n$ -- $sigma$-алгебры, они *независимы*, если 
  $
    forall A_1 in cal(A)_1, ..., A_n in cal(A)_n, space A_1,...,A_n - " независимы"
  $
]

#definition[
  Измеримую функцию $X:(Omega, cal(A), PP) --> (cal(R), cal(F))$ -- измеримое пространство, будем называть:
  + *случайной величиной*, если $(cal(R), cal(F)) = (RR, cal(B)^1)$ ($cal(B)$ - борелевская мера)
  + *случайным вектором*, если $(cal(R), cal(F)) = (RR^n, cal(B)^n)$
  В общем случае $X$ называется *случайным элементом*.
]

#remark[
  Если $X_1,X_2$ -- случайный величины, $PP(X_1 eq.not X_2) = PP(omega in Omega, space X_1(omega) eq.not X_2(omega)) = 0$, тогда будем считать $X_1 = X_2$
]

#definition[
  *Распределением случайного элемента* $X$ будем называть единичную меру $P_X$ на $(cal(R), cal(F))$, что:
  $
    P_X (F) = PP(X in F) = PP(X^(-1)(F)), space F in cal(F)
  $
  Если $P_X_1 = P_X_2$ то $X_1, X_2$ *одинаково распределены*\
  $X$ -- случайный элемент, $cal(A)_X = {X^(-1)(F), space F in cal(F)}$ -- $sigma$-алгебра, тогда $X_1,...,X_n$ -- *независимы*, если $cal(A)_X_1,...,cal(A)_X_n$ -- независимы.
]

#definition[
  Пусть $X$ -- случайная величина, тогда *функцией распределения* $X$ называется:
  $
    F_X (r) = PP(X<=r), space r in RR
  $
]
#remark[
  Легко заметить следующие свойства функции распределения:
  + $F_X (r) in [0,1]$
  + $F_X arrow.tr$
  + $F_X (+oo) = 1$
  + $F_X (-oo) = 0$
  + $F_X$ непрерывна справа ($lim_(delta arrow.br 0) F_X (r + delta) = F_X (r)$)
]

#pagebreak()

== Характеризация распределений.

Можем определить несколько типов распределений случайных велечин:
+ Дискретное
+ Абсолютно непрерывное
+ Сингулярно непрерывное
Существует теорема (разложение Хана) о том, что любое распределение раскладывается в сумму распределений этих трёх типов. Определим же их:

#definition[
  *Дискретным распределением* называется распределение, такое что:
  $
    exists x_1,x_2,... in RR, space sum_j PP(X = x_j) = 1, " равносильно " P_X (union.big_j {x_j}) = 1
  $
]
#example[
  + Распределение Бернулли $B(p)$: $P_X ({1}) = p, space P_X ({0}) = 1-p$
  + Биномиальное $cal(B)(n,p)$: $P_X ({k}) = C_n^k p^k (1-p)^(n-k)$
  + Геометрическое $G(p)$: $P_X ({k}) = (1-p)p^k$
]

#definition[
  *Абсолютно непрерывным распределением* называется распределение, что $P_x << lambda$ -- мера Лебега, то есть:
  $
    lambda(A) = 0 ==> P_X (A) = 0
  $
  А также существует $p_X>=0$ - *функция плотности*, что:
  $
    P_X (B) = PP(X in B) = integral_B p_X (r) d r, space B in cal(B)^1\
    integral_(-oo)^oo p_x (r) d r = 1 = PP(X in RR)
  $
]
#example[
  + $P_X = U[a,b]$ ($U - "uniform"$, не путать с объединением!!!) - равномерное распределение: $
    p_X (r) = cases(0"," r in.not [a,b], 1/(b-a)"," r in [a,b])
  $
  + Показательное (экспоненциальное) распределение ($a>0$): $
    p_X (r) = cases(0"," r<0, 1/a e^(-r/a)"," r>=0)
  $
  + Нормальное распределение $N(a,sigma^2), space a in RR, space sigma^2 >0$: $
    p_x (r) = 1/(sqrt(2pi)sigma) e^(-(r-a)^2/(2sigma^2))
  $ например, если $a = 0, sigma^2 = 1$, то:$
    (1/(sqrt(2pi)) integral_RR e^(-r^2/2) d r)^2 = 1/(sqrt(2pi)) 1/(sqrt(2pi)) integral_RR integral_RR e^(-x^2/2) e^(-y^2/2)d x d y = 1/(2pi) integral_0^(2pi) integral_0^oo r e^(-r^2/2) d r d phi = 1
  $                             
]

#definition[
  *Сингулярно непрерывные распределением* называется распределение $
    P_x ({r}) = 0, space forall r in RR
  $
  А также $exists B in cal(B), space lambda(B) = 0$ и $P_X (B)=1$
]
#example[
  $X = sum^oo_(j=0) X_j 3^(-j)$ где $X_j$ -- независимы, $P_X_j = B(1/2)$ - распределение Бернулли 
]

#v(1em)

Рассмотрим случайный вектор $X = (X_1,...,X_n)$. Можно заметить, что $X$ - случайный вектор тогда и только тогда, когда $X_1,...,X_n$ -- случайные величины (по свойству сохранения измеримости при декартовом произведении).\

Пусть опять $X = (X_1,...,X_n)$ -- случайный вектор, $P_X$ -- мера в $RR^n$, тогда меры $P_X_i$ на $RR$ будем называть *маргинальными распределениями*, легко заметить, что их однозначно определяет $P_X$:
$
  P_X_1 (B) = PP(X_1 in B) = PP(X in B times RR^(n-1)) = P_X (B times RR^(n-1))
$
Обратное просто неверно: по маргинальным распределениям нельзя восстановить исходную. В качестве контрпримера подходит два случайных вектора на квадрате, один равномерно распределен на всем квадрате, другой только на диагонали - очевидно их маргинальные распределения не совпадут.
