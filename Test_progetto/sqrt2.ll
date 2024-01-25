define double @iterate(double %y, double %x) {
entry:
  %z = alloca double, align 8
  %eps = alloca double, align 8
  %x2 = alloca double, align 8
  %y1 = alloca double, align 8
  store double %y, ptr %y1, align 8
  store double %x, ptr %x2, align 8
  store double 1.000000e-04, ptr %eps, align 8
  %x3 = load double, ptr %x2, align 8
  %x4 = load double, ptr %x2, align 8
  %mulres = fmul double %x3, %x4
  store double %mulres, ptr %z, align 8
  %eps5 = load double, ptr %eps, align 8
  %z6 = load double, ptr %z, align 8
  %y7 = load double, ptr %y1, align 8
  %subres = fsub double %z6, %y7
  %lttest = fcmp ult double %eps5, %subres
  %eps8 = load double, ptr %eps, align 8
  %y9 = load double, ptr %y1, align 8
  %z10 = load double, ptr %z, align 8
  %subres11 = fsub double %y9, %z10
  %lttest12 = fcmp ult double %eps8, %subres11
  %ortest = or i1 %lttest, %lttest12
  br i1 %ortest, label %forbody, label %endcond

forbody:                                          ; preds = %forcond, %entry
  %x13 = load double, ptr %x2, align 8
  %x14 = load double, ptr %x2, align 8
  %mulres15 = fmul double %x13, %x14
  store double %mulres15, ptr %z, align 8
  br label %forcond

forcond:                                          ; preds = %forbody
  %x16 = load double, ptr %x2, align 8
  %y17 = load double, ptr %y1, align 8
  %x18 = load double, ptr %x2, align 8
  %divres = fdiv double %y17, %x18
  %addres = fadd double %x16, %divres
  %divres19 = fdiv double %addres, 2.000000e+00
  store double %divres19, ptr %x2, align 8
  %eps20 = load double, ptr %eps, align 8
  %z21 = load double, ptr %z, align 8
  %y22 = load double, ptr %y1, align 8
  %subres23 = fsub double %z21, %y22
  %lttest24 = fcmp ult double %eps20, %subres23
  %eps25 = load double, ptr %eps, align 8
  %y26 = load double, ptr %y1, align 8
  %z27 = load double, ptr %z, align 8
  %subres28 = fsub double %y26, %z27
  %lttest29 = fcmp ult double %eps25, %subres28
  %ortest30 = or i1 %lttest24, %lttest29
  br i1 %ortest30, label %forbody, label %endcond

endcond:                                          ; preds = %forcond, %entry
  %condval = phi double [ %mulres15, %forcond ], [ 1.000000e+00, %entry ]
  %x31 = load double, ptr %x2, align 8
  ret double %x31
}

define double @sqrt(double %y) {
entry:
  %y1 = alloca double, align 8
  store double %y, ptr %y1, align 8
  %y2 = load double, ptr %y1, align 8
  %eqtest = fcmp ueq double %y2, 1.000000e+00
  br i1 %eqtest, label %trueexp, label %falseexp

trueexp:                                          ; preds = %entry
  br label %endcond11

falseexp:                                         ; preds = %entry
  %y3 = load double, ptr %y1, align 8
  %lttest = fcmp ult double %y3, 1.000000e+00
  br i1 %lttest, label %trueexp4, label %falseexp7

trueexp4:                                         ; preds = %falseexp
  %y5 = load double, ptr %y1, align 8
  %y6 = load double, ptr %y1, align 8
  %subres = fsub double 1.000000e+00, %y6
  %calltmp = call double @iterate(double %y5, double %subres)
  br label %endcond

falseexp7:                                        ; preds = %falseexp
  %y8 = load double, ptr %y1, align 8
  %y9 = load double, ptr %y1, align 8
  %divres = fdiv double %y9, 2.000000e+00
  %calltmp10 = call double @iterate(double %y8, double %divres)
  br label %endcond

endcond:                                          ; preds = %falseexp7, %trueexp4
  %condval = phi double [ %calltmp, %trueexp4 ], [ %calltmp10, %falseexp7 ]
  br label %endcond11

endcond11:                                        ; preds = %endcond, %trueexp
  %condval12 = phi double [ 1.000000e+00, %trueexp ], [ %condval, %endcond ]
  ret double %condval12
}

