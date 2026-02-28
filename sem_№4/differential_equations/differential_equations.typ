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
    fill: oklch(91.47%, 0.169, 117.19deg),
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
  #v(2em)
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

== Основные определения.
#v(1em)

Рассмотрим нормальную систему диф уравнений $dot(x) = f(t,x)$, $f in C$, $I(t,xi)$ - максимальный промежуток для решения $x(t,tau,xi)$
#definition[
    $x(t,tau,xi_0) - " решение", space I(t,xi_0)supset[tau, oo)$, *устойчиво по Ляпунову*, если $forall epsilon gt 0 space exists delta gt 0$: 
    + $forall xi$, $|xi - xi_0| < delta ==> I(t,xi_0)supset[tau, oo)$
    + $|x(t,tau,xi) - x(t,tau,xi_0)|<epsilon, space t gt.eq tau$

    Решение *неустойчиво* если оно не устойчиво.
]

#definition[
    Решение $x(t,tau,xi_0)$ *асимптотически устойчиво*, если оно устойчиво по Ляпунову и 
    $
    exists delta >0 space forall xi, |xi-xi_0|<delta, space lim_limits(t-->oo) |x(t,tau,xi) - x(t,tau,xi_0)| = 0
    $
]


Пусnь $(M, d)$ - метрическое пространство, рассмотрим счетное семейство непрерывных функций: $F = {f_k:M -> M, k gt.eq 0}, space f_k in C(M)$, для него определим траекторию элемента:\
$x_0 in M, space O^+(x_0, F) = {x_k in M :k gt.eq 0}: space x_k = f_k (x_0)$

#definition[
    $O^+(x_0,F)$ - *устойчиво по Ляпунову*, если 
    $
    forall epsilon>0 space exists delta > 0: space forall y_0 in M, space d(x_0, y_0)<delta ==> O^+(y_0,F) = {y_k}, space d(x_k,y_k)< epsilon, space k gt.eq 0
    $
]

#definition[
    $O^+(x_0,F)$ - *асимптотически устойчиво*, если есть устойчивость по Ляпунову и 
    $
    exists delta > 0 space forall y_0 in M, space d(x_0, y_0)<delta ==> lim_limits(k-->oo) d(x_k,y_k) = 0
    $
]

#v(2em)
== Линейная устойчивость.
#v(1em)
Разберем сначала простой случай линейных систем:\  
Пусть $M = RR^n$, $F = {A_k, k gt.eq 0}$, где $A_k$ - матрица, $f_k (x) = A_k x+g_k$, рассматривается однородная задача $g_k eq.triple 0$.\
Определим $O^+(x_0, {Phi_k}) = {x_k}, space$ где $x_(k+1)= A_k x_k, space space x_k = A_(k-1) dot ... dot A_0 x_0,$
$
Phi_k = A_(k-1) dot ... dot A_0, space Phi_0 = E
$  

#pagebreak()

#theorem[  
    Пусть $Phi_k$, $k gt.eq 0$ - оператор, тогда следующие условия эквивалентны:\
    + $forall x_0 space O^+(x_0, {Phi_k})$ - устойчивое по Ляпунову
    + $O^+(0, {Phi_k})$ - устойчивое
    + $exists M > 0$ : $|Phi_k x_0| < M|x_0|$ для всех $k gt.eq 0$
]
#proof[\
    $(1) ==> (2)$ - очевидно\
    $(2) ==> (3)$ \ 
    Возьмем $epsilon = 1$, тогда $exists delta > 0$ такое что $forall y_0, space |y_0|<delta ==> |y_k| = |Phi_k y_0|<1$.\
    Возьмем $x_0, space |x_0| = 1$, тогда для $y_0 = delta/2 x_0$ имеем $|Phi_k y_0|<1$, значит $|Phi_k x_0| = 2/delta |Phi_k y_0| < 2/delta = M$.\
    Общий случай очевидно получаем из верности утверждения для векторов вида $x_0 / (|x_0|)$ \
    $(3)==>(1)$ \ 
    Пусть $x_0: space |y_0-x_0|<delta$. Тогда $|y_k-x_k| = |Phi_k (y_0-x_0)| < M delta, space$ что и требовалось.
]

Теперь рассмотрим аналогичную теорему для асимптотической устойчивости:

#theorem[  
    Пусть $Phi_k$, $k gt.eq 0$ - оператор, тогда следующие условия эквивалентны:\
    + $forall x_0 space O^+(x_0, {Phi_k})$ - асимптотически устойчивое
    + $O^+(0, {Phi_k})$ - асимптотически устойчивое
    + $||Phi_k||-->0$ при $k-->oo space$ (где под $||dot||$  имеется ввиду операторная норма)
]
#proof[\
    $(1) ==> (2)$ - очевидно\
    $(2) ==> (3)$ \ 
    Возьмем $epsilon = 1$, тогда $exists delta > 0$ такое что $forall y_0, space |y_0|<delta ==> |y_k| = |Phi_k y_0|<1$ и $lim_limits(k-->oo) |Phi_k y_0| = 0$.\
    Возьмем $x_0, space |x_0| = 1$, тогда для $y_0 = delta/2 x_0$ имеем $|Phi_k y_0|<1$ и $lim_limits(k-->oo) |Phi_k y_0| = 0$, значит $||Phi_k|| = sup_limits(|x_0|=1) |Phi_k x_0| = 2/delta sup_limits(|y_0|=delta/2) |Phi_k y_0| --> 0$.\
    $(3)==>(1)$ \ 
    Фиксируем $epsilon>0$, пусть $x_0: space |y_0-x_0|<delta$. Тогда $|y_k-x_k| = |Phi_k (y_0-x_0)| lt.eq ||Phi_k|| |y_0-x_0| lt.eq ||Phi_k|| delta --> 0, space$ при $k --> oo space$ (устойчивость по Ляпунову следует из предыдущей теоремы, так как очевидно $||Phi_k||$ должно быть ограничены).
]

#lecture("24.02.2026")

#remark[
    Заметим, что если $A_k = A, space forall k gt.eq 0$, то $Phi_k = A^k, space J = S^(-1)A S$  - жорданова форма, $J_m$ - клетка размера $m$ тогда:
    $
       "асимптотическая устойчивость" <==> ||J_m^k|| --> 0 <==>|lambda|<1 "(где "lambda" - собственное число клетки)"\
       "устойчивость по Ляпунову" <==> ||J_m^k|| " - ограничено" <==>|lambda| = 1, space m = 1
    $
]

#v(2em)
== Дискретные функции Ляпунова.
#v(1em)

Пусть $f$ - непрерывное отображение в метрическом пространстве $(M,d)$, $space B(a,x)$ - замкнутый шар с центром в $x$ и радиуса $a$ - в метрическом пространстве компактен. Будем смотреть на неподвижные точки $f(p)=p$.

#definition[
    $V(x)$ - непрерывная функция на $(M,d)$ называется *дискретной функцией Ляпунова* для функции $f$ и неподвижной точки $p$, если:
    + $V(x)gt.eq 0 space forall x in M$
    + $V(x) = 0 <==> x=p$
]

#lemma[
    $x_k in B(r,p), space x_k --> p <==> V(x_k) --> 0$
]
#proof[\
    1) $==>$: - очевидно по непрерывности $V$\
    2) $<==$: Допустим противное, тогда так как шар - компакт, существует сходящаяся подпоследовательность $X_k_m --> q$, тогда $V_k_m --> V(q) = 0$ по условию, а значит $q = p$.
]

#theorem[(об устойчивости)\
    Пусть $V$ - дискретная функция Ляпунова для $f$ и $p$. Тогда если $exists rho >0,$\
    $ space forall x in B(rho,p) space V(f(x)) lt.eq V(x)$, то $p$ - устойчиво 
    (то есть $O^+(p, {f^k})$ - устойчиво)
]
#proof[
    Возьмем $epsilon>0$ так, чтобы образ замкнутого шара $f(B(epsilon,p))$ лежал в области определения $V$, тогда найдем такое $delta$, что $V(x)<delta ==> x in B(epsilon, p)$.\
    Пусть такого $delta$ нет, тогда есть последовательность ${x_k}, space V(x_k) --> 0, space d(x_k,p) gt.eq epsilon$ - что невозможно по лемме. Заметим, что существует $tau in (0,epsilon)$, что $x in B(tau, p) ==> V(x)<delta$. \
    Пусть $x_0 in B(tau, p)$, тогда $f(x_0)=x_1$ лежит в области определения $V$, тогда $V(x_1)lt.eq V(x_0) < delta$.
    Продолжим рассуждение по индукции (все будет работать, так как $V(x_n)<delta ==> x_n in B(epsilon,p)$ по определению $delta$), получим что траектория $x_0$ не покинет $B(epsilon,p)$ - что и требовалось.
]

Докажем аналогичную теорему для асимптотической устойчивости:
#theorem[ (об асимптотической устойчивости)\
    Пусть $V$ - дискретная функция Ляпунова для $f$ и $p$. \ Тогда если $exists rho >0, space (forall x in B(rho,p), space x eq.not p ==> V(f(x)) < V(x)) ==> p$ - асимптотичски устойчиво (то есть $O^+(p, {f^k})$ - асимптотически устойчиво)
]
#proof[\
    По предыдущей теореме если выбрать $epsilon < rho, space exists delta>0, space x_0 in B(delta,p), space x_k = f^k (x_0) in B(epsilon,p)$\
    Рассмотрим последовательность $x_k --> p, space x_k eq.not p,  space v_k = V(x_k)>0, " тогда "space v_k --> a,"пусть" a>0$\
    Обозначим $X = {y: exists k_m --> oo, space x_(k_m) --> y}$ - оно не пусто по компактности (${x_k} subset B(epsilon,p)$), тогда $V(y) = a, space forall y in X, f(y) in X ==> a = V(f(y)) < V(y) = a$ (неравенство выполнено так как из $a>0$ следует $y eq.not p$) - противоречие.
]

#pagebreak()

Теперь выведем условия для неустойчивости:
#theorem[(о неустойчивости)
    Пусть $f$ - непрерывна, $p$ - неподвижная точка, \ если $exists S$ - замкнутое, $V$ - непрервына на $S, space r>0$, а также:
    + $p in S, space V(p) = 0$
    + $exists rho>0, space x in B(rho,p) inter S ==> f(x) in B(r,p)inter S, space V(f(x)) > f(x)$
    + $forall delta >0 space exists x in B(delta, p) inter S, space V(x)>0$
    Тогда $p$ - неустойчиво.
]
#proof[
    $
      "Допустим противное: "epsilon = q, space exists delta >0 space forall x in B(delta, p) space f^k (x) in B(epsilon, p) = B(q, p) "тогда:"\
      exists x_0 in B(delta, p) inter S: space V(x_0)>0\
      v_k = V(x_k), space x_0 eq.not p, space x_k in B(r,p)inter S, space v_0<v_1< dots ==> exists lim v_k = a, " пусть">0 
    $ 
    Аналогично предыдущей теореме рассмотрим  $X = {lim x_k_m}, space X eq.not emptyset, space forall y in X space f(y) in X ==> a = V(f(y)) > V(y) = a$ для $f(y)in X$!??
]
#v(2em)

Теперь рассмотрим частный случай:
пусть $f: RR^n -> RR^n, space f in C^1, space f(0)=0$
#proposition[
    $m in NN, space 0$ - устойчиво (асимптотичски) для $f <==> 0$ - устойчиво (асимптотически) для $f^n$
]
#proof[
    Очевидно, если последовательность ${f^k (x_0)}$ - ограничена то и ${f^(n k) (x_0)}$ тоже, аналогчино со сходимостью к нулю и наоборот.
]

#v(1em)
Данную дифф функцию $f$ можно мыслить: $f(x) = A x + F(x), space F(0) = 0, space (partial F)/(partial x) (0) = 0, space A = D f(0)$

#theorem[ (об асимптотической устойчивости)
    $forall lambda_i$ - собственного числа $A, space |lambda_i|< 1 ==> 0$ - асимптотически устойчиво для $f$. 
]
#proof[
    Из условия напрямую следует что $||A^m|| --> 0$ при $m --> oo$\
    $
    f^m (x) = A^m x + F_m (x), space F_m (0) = 0, space (partial F_m)/(partial x) (0) = 0, space ||A^m|| = mu<1
    $
    Рассмотрим $mu_1 in (mu,1),space exists rho > 0 space 
    |x| < rho ==> |F_m (x)|lt.eq (mu_1 - mu)|x|$, фиксируем $x eq.not 0$ \
    $ 
      V(f^m (x)) = |f^m (x)| = |A^m (x) + F_m (x)| lt.eq |A^m x| + |F_m (x)|lt.eq mu|x|+(mu_1 - mu)|x| < |x| = V(x)
    $
    По предыдущему утверждению и теореме об асимптотической устойчивости получаем требуемое.
]

#theorem[ (о неустойчивости)
    $exists lambda$ - собственное число $A, space |lambda_i|> 1 ==> 0$ - неустойчиво (в этой теореме предполагаем что $A$ - диагонализируемая)
]
#proof[
    $|lambda_j|>lambda>1$ для $j = 1,dots,l$, а все остальные $lt.eq 1$\
    Введем две функции $X_1 (x)= |x_1| + dots +|x_l|$ и $X_2 = |x_(l+1)| + dots + |x_n|, space X=X_1+X_2$ - норма,\
    $S= {x: X_2(x)lt.eq X_1(x)}, space V(x) = X_1(x) - X_2(x)$ - непрерывно, $gt.eq 0$ на $S$.\
    $
    exists C>0," что "|x|lt.eq c X(x), " а также "exists mu >0, space 2 mu n< lambda-1, "ну и"\
     exists p> 0 space |x|lt.eq q ==> F(x)lt.eq M/c|x|lt.eq mu X(x) space (f(B(q,0)) subset B(1,0))\
    x in S inter B(q, 0), space x eq.not 0, space V(x)>0 ==> V(f(x)) > 0 ==> X_1(f(x))-X_2(f(x))>0 ==> f(x) in S
    $  
    Возьмем $x in S, space X_1(x)>0:$
    $
     f(x) = (f_1(x), dots, f_n (x)), space F(x) = (F_1(x), dots, F_n (x)), space f_i (x) = lambda_i x_i + F_i (x) " (из диагонализируемости)"\
     |f_i (x)| gt.eq lambda_i |x_i| - |F_i (x)| gt.eq lambda_i |x_i| - 2mu X_1(x)\
     |f_i (x)| lt.eq |x_i| + 2mu X_1(x)\
     X_1(f(x)) gt.eq lambda X_1(x) - 2l mu X_1(x)\
     X_2(f(x)) <= X_2(x) + 2(n-l)mu X_1(x)\
     V(f(x)) = X_1 (f(x)) - X_2 (f(x)) gt.eq  V(x) + (lambda-1-2mu n)X_1(x) > V(x) " (так как "lambda-1-2mu n>0")"
    $
]
 
