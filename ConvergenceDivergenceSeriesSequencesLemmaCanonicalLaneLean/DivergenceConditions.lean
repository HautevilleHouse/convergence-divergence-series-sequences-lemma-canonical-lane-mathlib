import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure NthTermTestPackage where
  termLimit : ℕ → ℝ
  termNotZero : Prop
  divergenceCondition : Prop

structure GrossTestPackage where
  comparisonDiverges : Prop
  limitComparisonDiverges : Prop
  ratioDiverges : Prop
  rootDiverges : Prop

structure AlternatingSeriesPackage where
  termsDecreaseToZero : Prop
  alternatingConvergence : Prop
  conditionalConvergence : Prop
  absoluteDivergence : Prop

structure DivergenceConditionsPackage where
  nthTermTest : NthTermTestPackage
  grossTest : GrossTestPackage
  alternatingSeries : AlternatingSeriesPackage

structure DivergenceConditionsEvidence (D : DivergenceConditionsPackage) where
  nthTermTestClosed : D.nthTermTest.divergenceCondition ∧ D.nthTermTest.termNotZero
  grossTestClosed : D.grossTest.comparisonDiverges ∨ D.grossTest.limitComparisonDiverges ∨ D.grossTest.ratioDiverges ∨ D.grossTest.rootDiverges
  alternatingSeriesClosed : D.alternatingSeries.conditionalConvergence ∧ D.alternatingSeries.absoluteDivergence

def DivergenceConditionsClosed (D : DivergenceConditionsPackage) : Prop :=
  (D.nthTermTest.divergenceCondition ∧ D.nthTermTest.termNotZero) ∧
  (D.grossTest.comparisonDiverges ∨ D.grossTest.limitComparisonDiverges ∨ D.grossTest.ratioDiverges ∨ D.grossTest.rootDiverges) ∧
  (D.alternatingSeries.conditionalConvergence ∧ D.alternatingSeries.absoluteDivergence)

theorem divergence_conditions_closed_from_evidence
    (D : DivergenceConditionsPackage) (E : DivergenceConditionsEvidence D) :
    DivergenceConditionsClosed D := by
  exact And.intro E.nthTermTestClosed
    (And.intro E.grossTestClosed E.alternatingSeriesClosed)

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse