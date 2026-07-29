import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.ConvergenceCriteriaPackage

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure SeriesConvergencePackage {C : ConvergenceCriteriaPackage} where
  partialSumSequence : Type u
  convergenceDefinedViaPartialSums : Prop
  termTestDivergence : Prop
  geometricSeriesTest : Prop
  pSeriesTest : Prop
  convergenceDefinedViaPartialSumsProof : convergenceDefinedViaPartialSums
  termTestDivergenceProof : termTestDivergence
  geometricSeriesTestProof : geometricSeriesTest
  pSeriesTestProof : pSeriesTest

structure SeriesConvergenceEvidence {C : ConvergenceCriteriaPackage}
    (S : SeriesConvergencePackage C) where
  convergenceDefinedViaPartialSumsClosed : S.convergenceDefinedViaPartialSums
  termTestDivergenceClosed : S.termTestDivergence
  geometricSeriesTestClosed : S.geometricSeriesTest
  pSeriesTestClosed : S.pSeriesTest

def SeriesConvergenceClosed {C : ConvergenceCriteriaPackage}
    (S : SeriesConvergencePackage C) : Prop :=
  S.convergenceDefinedViaPartialSums ∧ S.termTestDivergence ∧
  S.geometricSeriesTest ∧ S.pSeriesTest

theorem series_convergence_closed_from_evidence {C : ConvergenceCriteriaPackage}
    (S : SeriesConvergencePackage C) (E : SeriesConvergenceEvidence S) :
    SeriesConvergenceClosed S := by
  exact And.intro E.convergenceDefinedViaPartialSumsClosed
    (And.intro E.termTestDivergenceClosed
      (And.intro E.geometricSeriesTestClosed E.pSeriesTestClosed))

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse