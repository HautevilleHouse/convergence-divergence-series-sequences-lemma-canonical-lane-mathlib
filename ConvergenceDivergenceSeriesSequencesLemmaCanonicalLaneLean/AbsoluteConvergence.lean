import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure AbsoluteConvergencePackage where
  absoluteConvergenceImpliesConvergence : Prop
  comparisonTestAbsolute : Prop
  ratioTestAbsolute : Prop
  rootTestAbsolute : Prop
  rearrangementTheorem : Prop

structure AbsoluteConvergenceEvidence (A : AbsoluteConvergencePackage) where
  absoluteConvergenceImpliesConvergenceClosed : A.absoluteConvergenceImpliesConvergence
  comparisonTestAbsoluteClosed : A.comparisonTestAbsolute
  ratioTestAbsoluteClosed : A.ratioTestAbsolute
  rootTestAbsoluteClosed : A.rootTestAbsolute
  rearrangementTheoremClosed : A.rearrangementTheorem

def AbsoluteConvergenceClosed (A : AbsoluteConvergencePackage) : Prop :=
  A.absoluteConvergenceImpliesConvergence ∧ A.comparisonTestAbsolute ∧
  A.ratioTestAbsolute ∧ A.rootTestAbsolute ∧ A.rearrangementTheorem

theorem absolute_convergence_closed_from_evidence (A : AbsoluteConvergencePackage)
    (E : AbsoluteConvergenceEvidence A) : AbsoluteConvergenceClosed A := by
  exact And.intro E.absoluteConvergenceImpliesConvergenceClosed
    (And.intro E.comparisonTestAbsoluteClosed
      (And.intro E.ratioTestAbsoluteClosed
        (And.intro E.rootTestAbsoluteClosed E.rearrangementTheoremClosed)))

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse