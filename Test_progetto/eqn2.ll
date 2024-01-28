declare double @sqrt(double)

declare double @printval(double, double, double)

define double @eqn2(double %a, double %b, double %c) {
entry:
  %x2 = alloca double, align 8
  %x1 = alloca double, align 8
  %delta36 = alloca double, align 8
  %x12 = alloca double, align 8
  %im = alloca double, align 8
  %re = alloca double, align 8
  %delta = alloca double, align 8
  %delta2 = alloca double, align 8
  %c3 = alloca double, align 8
  %b2 = alloca double, align 8
  %a1 = alloca double, align 8
  store double %a, ptr %a1, align 8
  store double %b, ptr %b2, align 8
  store double %c, ptr %c3, align 8
  %b4 = load double, ptr %b2, align 8
  %b5 = load double, ptr %b2, align 8
  %mulres = fmul double %b4, %b5
  %a6 = load double, ptr %a1, align 8
  %mulres7 = fmul double 4.000000e+00, %a6
  %c8 = load double, ptr %c3, align 8
  %mulres9 = fmul double %mulres7, %c8
  %subres = fsub double %mulres, %mulres9
  store double %subres, ptr %delta2, align 8
  %delta210 = load double, ptr %delta2, align 8
  %lttest = fcmp ult double %delta210, 0.000000e+00
  br i1 %lttest, label %trueexp, label %falseexp

trueexp:                                          ; preds = %entry
  %delta211 = load double, ptr %delta2, align 8
  %subres12 = fsub double 0.000000e+00, %delta211
  %calltmp = call double @sqrt(double %subres12)
  store double %calltmp, ptr %delta, align 8
  %b13 = load double, ptr %b2, align 8
  %a14 = load double, ptr %a1, align 8
  %mulres15 = fmul double 2.000000e+00, %a14
  %divres = fdiv double %b13, %mulres15
  %subres16 = fsub double 0.000000e+00, %divres
  store double %subres16, ptr %re, align 8
  %delta17 = load double, ptr %delta, align 8
  %a18 = load double, ptr %a1, align 8
  %mulres19 = fmul double 2.000000e+00, %a18
  %divres20 = fdiv double %delta17, %mulres19
  store double %divres20, ptr %im, align 8
  %re21 = load double, ptr %re, align 8
  %im22 = load double, ptr %im, align 8
  %calltmp23 = call double @printval(double %re21, double %im22, double 0.000000e+00)
  br label %endcond53

falseexp:                                         ; preds = %entry
  %delta224 = load double, ptr %delta2, align 8
  %eqtest = fcmp ueq double %delta224, 0.000000e+00
  br i1 %eqtest, label %trueexp25, label %falseexp33

trueexp25:                                        ; preds = %falseexp
  %b26 = load double, ptr %b2, align 8
  %a27 = load double, ptr %a1, align 8
  %mulres28 = fmul double 2.000000e+00, %a27
  %divres29 = fdiv double %b26, %mulres28
  %subres30 = fsub double 0.000000e+00, %divres29
  store double %subres30, ptr %x12, align 8
  %x1231 = load double, ptr %x12, align 8
  %calltmp32 = call double @printval(double %x1231, double 0.000000e+00, double 0.000000e+00)
  br label %endcond

falseexp33:                                       ; preds = %falseexp
  %delta234 = load double, ptr %delta2, align 8
  %calltmp35 = call double @sqrt(double %delta234)
  store double %calltmp35, ptr %delta36, align 8
  %b37 = load double, ptr %b2, align 8
  %subres38 = fsub double 0.000000e+00, %b37
  %delta39 = load double, ptr %delta36, align 8
  %addres = fadd double %subres38, %delta39
  %a40 = load double, ptr %a1, align 8
  %mulres41 = fmul double 2.000000e+00, %a40
  %divres42 = fdiv double %addres, %mulres41
  store double %divres42, ptr %x1, align 8
  %b43 = load double, ptr %b2, align 8
  %subres44 = fsub double 0.000000e+00, %b43
  %delta45 = load double, ptr %delta36, align 8
  %subres46 = fsub double %subres44, %delta45
  %a47 = load double, ptr %a1, align 8
  %mulres48 = fmul double 2.000000e+00, %a47
  %divres49 = fdiv double %subres46, %mulres48
  store double %divres49, ptr %x2, align 8
  %x150 = load double, ptr %x1, align 8
  %x251 = load double, ptr %x2, align 8
  %calltmp52 = call double @printval(double %x150, double %x251, double 1.000000e+00)
  br label %endcond

endcond:                                          ; preds = %falseexp33, %trueexp25
  %condval = phi double [ 0.000000e+00, %trueexp25 ], [ 1.000000e+00, %falseexp33 ]
  br label %endcond53

endcond53:                                        ; preds = %endcond, %trueexp
  %condval54 = phi double [ 0.000000e+00, %trueexp ], [ 1.000000e+00, %endcond ]
  ret double %condval54
}

