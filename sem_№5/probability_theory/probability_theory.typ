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

== Маргинальные распределения.

Рассмотрим случайный вектор $X = (X_1,...,X_n)$. Можно заметить, что $X$ - случайный вектор тогда и только тогда, когда $X_1,...,X_n$ -- случайные величины (по свойству сохранения измеримости при декартовом произведении).\

Пусть опять $X = (X_1,...,X_n)$ -- случайный вектор, $P_X$ -- мера в $RR^n$, тогда меры $P_X_i$ на $RR$ будем называть *маргинальными распределениями*, легко заметить, что их однозначно определяет $P_X$:
$
  P_X_1 (B) = PP(X_1 in B) = PP(X in B times RR^(n-1)) = P_X (B times RR^(n-1))
$
Обратное просто неверно: по маргинальным распределениям нельзя восстановить исходную. В качестве контрпримера подходит два случайных вектора на квадрате, один равномерно распределен на всем квадрате, другой только на диагонали - очевидно их маргинальные распределения не совпадут.


#pagebreak()

#lecture("08.09.2026")

#theorem[
  Следующие условия эквивалентны:
  + $X_1,...,X_n$ -- независимы
  + $P_((X_1,.,,,X_n)) = P_(X_1) times ... times P_(X_n)$ 
  + $PP(X_1<x_1, ..., X_n<x_n) = PP(X_1<x_1) dot ... dot PP(X_n<x_n)$
]
#proof[

  1)$==>$2):
  $
   P_((X_1,...,X_n)) (B_1 times ... times B_n) = PP(X_1^(-1)  (B_1), ..., X_n^(-1) (B_n)) = PP(X_1^(-1)  (B_1)) dot ... dot PP(X_n^(-1) (B_n)) =\ = P_(X_1) times ... times P_(X_n) (B_1 times ... times B_n)
  $
  
  2)$==>$1): аналогично предыдущему, развернув порядок равенств.

  2)$==>$3)
]

#lecture("15.09.2026")

#definition[
  $EE(X^k), space EE(|X|^k)$ будем называть *моментами*.
]

Для них выполнено неравенство Гёльдера:
$
  |EE(X Y)|<=(EE(|X|^p))^(1/p) (EE(|Y|^q))^(1/q), space 1/p + 1/q = 1
$
Из этого можно вывести:
$
  EE|X|^n<=(EE|X|^(n p ))^(1/p), space p>1
$

#v(1cm)

Также можем вывести неравенство Иенсена:\
Пусть $phi:RR-->RR$ -- выпукла вниз. Тогда:
$
  phi(EE X)<=EE phi(X)
$
Фиксируем точку $X$, докажем приближая $phi$ снизу прямой $l(x) = a + b x <= phi(x)$:
$
  l(EE X) = a+ b EE X = EE(a+b X) = EE(l(X))<=EE(phi(X))\
  phi(EE X) = sup l(EE(X))<=EE(phi(X))
$

== Дисперсия.

#definition[
  Определим *дисперсию*, как:
  $
    DD(X) = EE(X - EE X)^2
  $
]
#remark[
  Также верны и следующие свойства:
  + $DD(X) = EE(X^2)-(EE X)^2$
  + $DD(C) = 0$
  + $DD(X)>=0$
  + $DD(C X) = C^2 DD(X)$
  + $DD(X+C)=DD X$
  + Если $X_1, X_2$ -- независимы и одинаково распределены, то $DD(X_1) = 1/2EE(X-X_1)^2$ 
]

#example[
  + $PP(X = k) = e^(-a) (a^k)/(k!): space EE X = a, space DD X = a$
  + Случайная величина с распределением $p(x) = 1/a e^(-x/a), space x>0: space EE X = a, space DD X = a^2$
  + $p(x) = 1/(sqrt(2pi)sigma) e^(-(x-a)^2/(2sigma^2)): space EE X = a,space DD X = sigma^2$
  + $p(x) = 1/(b-a) chi_([a,b])(x): space EE X = (b+a)/2, space DD X = (b-a)^2/2$
]

#statement[
  Если $X,Y$ независимы:
  $
    DD(X+Y) = DD(X) + DD(Y)
  $
]
#proof[
 $
  DD(X+Y) = EE(X+Y)^2 - (EE(X+Y))^2 = EE(X^2)+EE(Y^2) + 2EE(X Y)-(EE X)^2 - (EE Y)^2 - 2EE X dot EE Y = \ =(EE(X^2)-(EE X)^2) + (EE(Y^2)-(EE Y)^2) = DD(X) + DD(Y)
 $
]
#remark[
  То же верно и для $X_1,...,X_n$ -- независимых:
  $
    DD(sum_(i=1)^n X_j) = sum_(i=1)^n DD X_i
  $ 
]

#definition[
  Ковариацией случайных величин с конечной дисперсией будем называть:
  $
    c o v(X,Y) = EE(X - EE X)(Y - EE Y) = EE(X Y)-EE X dot EE Y
  $
  $X,Y$ называются *некоррелированными*, если $c o v(X,Y)=0$
]
#remark[
  Можно также выписать следующие свойства:
  + $c o v(X,X) = DD X$
  + билинейность: $
                    c o v(C X, Y) = C c o v(X,Y)\
                    c o v(X_1+X_2,Y) = c o v(X_1,Y) + c o v(X_2,Y)\
                  $
  + симметричность: $c o v(X,Y) = c o v(Y, X)$
  + если $X,Y$ независимы, то $c o v(X,Y) = 0$
  + в предыдущем утверждении можем заменить независимые величины на некоррелируемые.
  + связь с дисперсиями: $
                           |c o v(X,Y)| = |EE(X - EE X)(Y - EE Y)|<=_("Гёльдер")(EE(X - EE X)^2)^(1/2) (EE(Y - EE Y)^2)^(1/2) = sqrt(DD(X)) sqrt(DD(Y))
                         $
]

#definition[
  *Коэфицент кореляции* определим как:
  $
    kappa.alt (X,Y) = (c o v (X,Y))/(sqrt(DD(X)) sqrt(DD(Y)))
  $
  Где $DD X>0, space DD Y > 0$
]
#remark[
  + $kappa.alt (X, Y) = 0 ==> X, Y$ - независимы
  + $kappa.alt (X,Y) = 1 ==> Y = a X + b, space a > 0$
  + $kappa.alt (X,Y) = -1 ==> Y = a X + b, space a < 0$
]

#v(1cm)

Давайте дадим геометрическую интерпретацию данным нами определениям.\
Будем рассматривать случайные величины с нулевым мат ожиданием:
$
  EE X = 0, space DD X = EE(X^2), space c o v(X,Y) = EE (X Y), space chi(X,Y) = (EE (X,Y))/(sqrt(EE(X^2)) sqrt(EE(Y^2)))
$
Итак, $X in L^2(Omega, cal(A), PP)$. Тогда:
+ $EE (X^2) = ||X||^2$
+ $sigma(X) = sqrt(EE(X^2)) = ||X||$
+ $c o v (X,Y) = (X,Y)$ -- соответственно некоррелируемые величины ортогональны.
+ $chi(X,Y) = cos phi_(X,Y)$

== Моменты случайных векторов.

#definition[
  Пусть есть $X = (X_1,...,X_n) in RR^n$. *Математическим ожидением* этого случайного вектора будем называть $EE X = (EE X_1,...,EE X_n) in RR^n$
]
#remark[
  Мат ожидание случайного вектора ведет себя аналогично -- также линейно и сохраняет константы.
]

#definition[
  *Матрицей ковариаций* случайного вектора будем называть следующую матрицу:
  $
    K_X = (c o v(X_i,X_j))_(1<=i,j<=n)
  $
]
#remark[
  Легко заметить, что $K_X:RR^n-->RR^n$ -- оператор
]
Возьмём базис ${e_i}_(1<=i<=n)$, тогда $(K_X e_i,e_j) = c o v (X_i,X_j)$ и можем вывести следующее:
$
  (K_X v,e_j) = (c o v (v,X), x_j)\
  (K_X v, u) = c o v((v,X),(u,X))
$

Все такие операторы, удовлетворяющие последнему равенству будем называть *ковариантными операторами вектора $X$*.

#v(1cm)

Пусть есть случайный вектор $X in RR^n, space L:RR^n-->RR^m, space Y = L X$ -- случайный вектор из $RR^n$. Пусть $v in RR^n$ -- вектор:
$
  EE(Y,v) = EE(L X, v) = EE(X, L^* v) = (EE X, L^* v) = (L EE X, v) ==> EE Y = L EE X
$
Теперь пусть $u,v in RR^n$:
$
  (K_Y v, u) = c o v((v,Y),(u,Y)) = c o v((v,L X),(u,L X)) = c o v((L^* v,X),(L^* u,X)) = \ =  (K_X L^* v, L^* u) = (L K_X L^*v,u) ==> K_Y = L K_X L^*
$

#pagebreak()
#align(center)[#text(size: 20pt)[= Характеристические функции.]]

== Основные определения.

#definition[
  Пусть есть случайная величина $X$. Её *характеристической функцией* будем называть такую $f_X: RR-->CC$:
  $
    f_X (t) = EE(e^(i t X))
  $
]

#remark[
  Можно заметить, что мы стали использовать матожидание от комплексного числа. Для этого отдельно определим случайную комплексную величину:
  $
    Y = Y_1 + i Y_2, space Y_1,Y_2 - "случайные величины"\
    EE Y = EE Y_1 + i EE Y_2
  $
  Также можем оценить хар функцию:
  $
    |EE Y| = sup_(|v|=1) (EE Y, v) = sup_(|v|=1) EE (Y, v)<=sup_(|v|=1) EE(|Y| |v|) = EE|Y| ==> \ ==> |f_X (t)| <=EE|e^(i t X)| = 1
  $
]

#remark[
  Для общего развития дадим определение ковариации для комплексных случайных величин:
  $
    c o v(Y_1,Y_2) = EE((Y_1 - EE Y_1)overline((Y_2 - EE Y_2)))\
    c o v(Y, Y) = EE|Y - EE X|^2\
    c o v(Y_2,Y_1) = overline(c o v (Y_1, Y_2))
  $
]

Теперь опишем свойства хар функций:
+ $f_X (0) = 1$
+ $f_(C X) (t) = f_X (C t)$
+ $f_(X+a) (t) = EE(e^(i t X), e^(i t a)) = e^(i t a) f_X (t)$
