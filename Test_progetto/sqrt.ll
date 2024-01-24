define double @err(double %a, double %b) {
entry:
  %b2 = alloca double, align 8
  %a1 = alloca double, align 8
  store double %a, ptr %a1, align 8
  store double %b, ptr %b2, align 8
  %a3 = load double, ptr %a1, align 8
  %b4 = load double, ptr %b2, align 8
  %lttest = fcmp ult double %a3, %b4
  br i1 %lttest, label %trueexp, label %falseexp

trueexp:                                          ; preds = %entry
  %b5 = load double, ptr %b2, align 8
  %a6 = load double, ptr %a1, align 8
  %subres = fsub double %b5, %a6
  br label %endcond

falseexp:                                         ; preds = %entry
  br label %endcond

endcond:                                          ; preds = %falseexp, %trueexp
  %condval = phi double [ %subres, %trueexp ], [ 0.000000e+00, %falseexp ]
  ret double %condval
}

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
  %calltmp = call double @err(double %z6, double %y7)
  %lttest = fcmp ult double %eps5, %calltmp
  br i1 %lttest, label %forbody, label %endcond

forbody:                                          ; preds = %forcond, %entry
  %x8 = load double, ptr %x2, align 8
  %x9 = load double, ptr %x2, align 8
  %mulres10 = fmul double %x8, %x9
  store double %mulres10, ptr %z, align 8
  br label %forcond

forcond:                                          ; preds = %forbody
  %x11 = load double, ptr %x2, align 8
  %y12 = load double, ptr %y1, align 8
  %x13 = load double, ptr %x2, align 8
  %divres = fdiv double %y12, %x13
  %addres = fadd double %x11, %divres
  %divres14 = fdiv double %addres, 2.000000e+00
  store double %divres14, ptr %x2, align 8
  %eps15 = load double, ptr %eps, align 8
  %z16 = load double, ptr %z, align 8
  %y17 = load double, ptr %y1, align 8
  %calltmp18 = call double @err(double %z16, double %y17)
  %lttest19 = fcmp ult double %eps15, %calltmp18
  br i1 %lttest19, label %forbody, label %endcond

endcond:                                          ; preds = %forcond, %entry
  %condval = phi double [ %mulres10, %forcond ], [ 1.000000e+00, %entry ]
  %x20 = load double, ptr %x2, align 8
  ret double %x20
}

define double @sqrt(double %y) {
entry:
  %y1 = alloca double, align 8
  store double %y, ptr %y1, align 8
  %y2 = load double, ptr %y1, align 8
  %eqtest = fcmp ueq double %y2, 1.000000e+00
  br i1 %eqtest, label %trueexp, label %falseexp

trueexp:                                          ; preds = %entry
  br label %endcond

falseexp:                                         ; preds = %entry
  br label %endcond

endcond:                                          ; preds = %falseexp, %trueexp
  %condval = phi double [ 1.000000e+00, %trueexp ], [ 0.000000e+00, %falseexp ]
  ret double %condval
}

