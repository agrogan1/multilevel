# Multilevel Mediation

## Introduction

A folder with an example of multilevel mediation.

> [!IMPORTANT]  
> Under development. The diagram and equations are pretty good. The syntax needs work. Comments, questions, and corrections are most welcome.

>[!NOTE]
> `x` is an independent variable of primary interest. `z` is another indendent variable--sometimes thought of as a control variable--of secondary interest. `m` is a mediator. `y` is the outcome.

[Here](https://github.com/agrogan1/multilevel/blob/master/multilevel-mediation/multilevel-mediation.do) is a direct link to the `do` file above.

Perhaps helpfully, perhaps confusingly, I have also included syntax for mediation with clustered standard errors.

The graphs (`.png` files) help to understand why the *multilevel* and *clustered standard error* analyses give different results.

## Equations

$y = \beta_0 + \beta_{my} m + \beta_{xy} x + \beta_{zy} z + u_{0j}$

$m = \beta_0 + \beta_{xm} x + \beta_{zm} z + u_{0j}$

## Diagram

![heuristic diagram of multilevel mediation](multilevel-mediation.png)

