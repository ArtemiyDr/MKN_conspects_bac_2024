#import "@preview/great-theorems:0.1.2": *
#import "@preview/fletcher:0.5.8": *

#set document(
    title: "Конспект по дифференциальным уравнениям и динамическим системам",
)
#set page("a4")
#set page(margin: 1.5cm)
#set text(12pt)
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
    #text(18pt)[Лектор: Пилюгин Сергей Юрьевич]
    #v(1.5em)
    #text(18pt)[Автор: Артемий Дружинин]
    #v(1em)
    #text(14pt)[Факультет МКН СПБГУ]
    #v(1em)
    #text(12pt)[Весенний семестр 2026]
]

#pagebreak()


#v(2em)
#align(center)[#text(size: 20pt)[= Продолжение общей теории дифференциальных уравнений.]]
#v(2em)

#lecture("17.02.2026")
== Еще раз об интегралах.
#v(1em)

Пусть есть уравнение $dot(x)=f(t,x), space x in RR^n, space f in C,space f in "Lip"_(x,"loc") (G)$
#definition[
    Пусть $u:H -> RR$, где $H subset G$ - область и $u in C^1(H)$, тогда $u$ называется *интегралом* уравнения $dot(x)=f(t,x)$, если для любого решения $x(t), space t in (a,b)$ такого что $(t, x(t)) in H$ выполнено:
    $
      u(t,x(t)) eq.triple "const"
    $
]

#definition[
    Пусть есть $n$ интегралов $u_1(t,x), ..., u_n (t,x)$ составим вектор \ $U(t,x) = mat(u_1 (t,x); ...; u_n (t,x))$, \тогда интегралы называются *функционально независимыми*, если 
    $
    "rank" (partial  U)/(partial x) = "rank" mat((partial u_1)/(partial x_1), ..., (partial u_1)/(partial x_n); dots.v, , dots.v; (partial u_n)/(partial x_1), ..., (partial u_n)/(partial x_n)) eq.triple n
    $
]

#theorem[(об интегралах) \
    Пусть $u_1(t,x), ..., u_n (t,x)$ - функционально независимые интегралы в $H$, тогда если:\
    $forall (t_0,x_0) in H space "существуют: " (a,b) in.rev t_0, space V$ - открытое в $RR^n$, $x_0 in V$ и $y:(a,b)->RR^n space y in C^1(a,b)$, выполнено:
    + $y(t_0) = x_0$
    + если $(t,x) in (a,b) times V$, то $U(t,x) = U(t_0,x_0) <==> $ $x = y(t)$
    + $y(t)$ - решение задачи Коши с начальными условиями в $(t_0,x_0)$
]
#proof[
    Рассмотрим функцию $W(t,x) = U(t,x) - U(t_0,x_0)$, тогда $W in C^1$.\
    $
    "det" (partial W)/(partial x) (t_0,x_0) eq.not 0
    $
    А тогда существует единственная неявная функция $x $ равная $y(t)$ в окрестности точки $(t_0,x_0)$, такая что $W(t,x) = 0$. По определению интеграла $U(t,x(t,t_0,x_0)) = U(t,x)$ ну и по единственности неявной функции $x(t) = x(t, t_0 ,x_0)$.
] 

#theorem[(о существовании системы функционально независимых интегралов) \
    Пусть $f, space (partial f)/(partial x) in C(H) ==> 
    forall (t_0,x_0) in H space exists G$ - окрестность $(t_0,x_0)$ что:
    + в $G$ существует $n$ функционально независимых интегралов $u_1(t,x), ..., u_n (t,x)$
    + $forall u(t,x)$ - интерграла в $G$ существует $g in C^1(G)$ : $u(t,x) = g(u_1(t,x), ..., u_n (t,x))$
]
#proof[
    По теореме о топологическом выпрямлении существует диффиоморфизм выпрямления $h: G -> h(G)$ такой что 
    $
      h(t,x) = (t, h_1(t,x), ..., h_n (t,x))
    $
    Тогда заметим, что $h_1(t,x), ..., h_n (t,x)$ - функционально независимые интегралы в $G$ (они интегралы так как переводят интегральные кривые в прямые параллельные $t$). Для этого рассмотрим матрицу $(partial h) / (partial (t,x))$ и поймем что её $"det"$ не ноль (так как якобиан $h$ не ноль). \
    Осталось показать, что любой другой интеграл $u(t,x)$ в $G$ может быть представлен в виде функции от $h_1(t,x), ..., h_n (t,x)$. Покажем что $v(t,y) = u(h^(-1)(t,y))$ не зависит от $t$. Зафиксируем произвольную точку $(t_0,y_0)$ и рассмотрим интегральную кривую проходящую через $(t_0,x_0) = h^(-1)(t_0,y_0)$, заметим что в координатах $y$ эта кривая становится прямой. Тогда по свойству интеграла $v$ постоянна на этой прямой, а значит не завсист от $t$. \
    $u(t,x) = u(h^(-1)(t,h(t,x))) = v(t, h(t,x))$ - зависит только от $h_i$.

]


Случай автономных систем рассмотрим в виде теоремы без доказательства:

#theorem[
    Пусть $dot(x) = f(x)$ - автономная система, $f in C^1$, $x_0$ - не точка покоя, тогда:
    + $exists W in.rev x_0$ - окрестность $x_0$, в которой существует $n$ функционально независимых интегралов $u_1(x), ..., u_n (x)$
    + $forall u(x)$ - интеграла в $W$, существует $g in C^1(W)$ : $u(x) = g(u_1(x), ..., u_n (x))$
]

#v(2em)
(возможен пропуск утверждения)

#pagebreak()

#v(2em)
#align(center)[#text(size: 20pt)[= Устойчивость.]]
#v(2em)

== Основные определения и свойства.
#v(1em)

Рассмотрим нормальную систему диф уравнений $dot(x) = f(t,x)$, $f in C$, $I(t,xi)$ - максимальный промежуток для решения $x(t,tau,xi)$
#definition[
    $x(t,tau,xi_0) - " решение", space I(t,xi_0)supset[tau, oo)$, *устойчиво по Ляпунову*, если $forall epsilon gt 0 space exists delta gt 0$: 
    + $forall xi$, $|xi - xi_0| ==> I(t,xi_0)supset[tau, oo)$
    + $|x(t,tau,xi) - x(t,tau,xi_0)|<epsilon, space t gt.eq tau$

    Решение *неустойчиво* если оно не устойчиво.
]

#definition[
    Решение $x(t,tau,xi_0)$ *асимптотически устойчиво*, если оно устойчиво по Ляпунову и 
    $
    exists delta >0 space forall xi, |xi-xi_0|<delta, space lim_limits(t-->oo) |x(t,tau,xi) - x(t,tau,xi_0)| = 0
    $
]


Пусnь $(M, d)$ - метрическое пространство, $F = {f_k:M -> M, k gt.eq 0}, space f_k in C(M)$\
$x_0 in M, space O^+(x_0, F) = {x_k in M :k gt.eq 0}: space x_k = f_k (x_0)$

#definition[
    $O^+(x_0, F)$ - *устойчивое по Ляпунову* множество, если 
    $
    forall epsilon>0 space exists delta > 0: space forall y_0 in M, space d(x_0, y_0)<delta ==> O^+(y_0,F) = {y_k}, space d(x_k,y_k)< epsilon, space k gt.eq 0
    $
]

#definition[
    $O^+(x_0, F)$ - *асимптотически устойчивое* множество, если оно устойчивое по Ляпунову и 
    $
    exists delta > 0 space forall y_0 in M, space d(x_0, y_0)<delta ==> lim_limits(k-->oo) d(x_k,y_k) = 0
    $
]

#v(2em)
== Линейная устойчивость.
#v(1em)

Пусть $M = RR^n$, $F = {A_k, k gt.eq 0}$, где $A_k$ - матрица, $f_k (x) = A_k x+g_k$, рассматривается однородная задача $g_k eq.triple 0$.\
Определим $x_(k+1)= A_k x_k$, $space x_k = A_(k-1) dot ... dot A_0 x_0, space A_(k-1) dot ... dot A_0 = Phi_k$  

#theorem[  
    Пусть $Phi_k$, $k gt.eq 0$ - оператор, тогда следующие условия эквивалентны:\
    + $forall x_0 space O^+(x_0, {A_k})$ - устойчивое по Ляпунову множество
    + $O^+(0, {A_k})$ - устойчивое по Ляпунову множество
    + $exists M > 0$ : $|Phi_k x_0| < M$ для всех $k gt.eq 0$
]
#proof[\
    $(1) ==> (2)$ - очевидно\
    $(2) ==> (3)$ \ 
    Возьмем $epsilon = 1$, тогда $exists delta > 0$ такое что $forall y_0, space |y_0|<delta ==> |y_k| = |Phi_k y_0|<1$.\
    Возьмем $x_0, space |x_0| = 1$, тогда для $y_0 = delta/2 x_0$ имеем $|Phi_k y_0|<1$, значит $|Phi_k x_0| = 2/delta |Phi_k y_0| < 2/delta = M$.\
    $(3)==>(1)$ \ 
    Пусть $x_0: space |y_0-x_0|<delta$. Тогда $|y_k-x_k| = |Phi_k (y_0-x_0)| < M delta, space$ что и требовалось.
]

Теперь рассмотрим аналогичную теорему для асимптотической устойчивости:

#theorem[  
    Пусть $Phi_k$, $k gt.eq 0$ - оператор, тогда следующие условия эквивалентны:\
    + $forall x_0 space O^+(x_0, {A_k})$ - асимптотически устойчивое множество
    + $O^+(0, {A_k})$ - асимптотически устойчивое множество
    + $||Phi_k||-->0$ при $k-->oo$
]
#proof[\
    $(1) ==> (2)$ - очевидно\
    $(2) ==> (3)$ \ 
    Возьмем $epsilon = 1$, тогда $exists delta > 0$ такое что $forall y_0, space |y_0|<delta ==> |y_k| = |Phi_k y_0|<1$ и $lim_limits(k-->oo) |Phi_k y_0| = 0$.\
    Возьмем $x_0, space |x_0| = 1$, тогда для $y_0 = delta/2 x_0$ имеем $|Phi_k y_0|<1$ и $lim_limits(k-->oo) |Phi_k y_0| = 0$, значит $||Phi_k|| = sup_limits(|x_0|=1) |Phi_k x_0| = 2/delta sup_limits(|y_0|=delta/2) |Phi_k y_0| --> 0$.\
    $(3)==>(1)$ \ 
    Фиксируем $epsilon>0$, пусть $x_0: space |y_0-x_0|<delta$. Тогда $|y_k-x_k| = |Phi_k (y_0-x_0)| lt.eq ||Phi_k|| |y_0-x_0| lt.eq M delta, space $ выберем $delta = epsilon/M, space $ получим $M delta< epsilon$ а значит $|y_k-x_k| --> 0$.
]
