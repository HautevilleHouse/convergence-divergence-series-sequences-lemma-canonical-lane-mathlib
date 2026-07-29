import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.SeriesSequenceDefinitions

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure ComparisonTest where
  seriesA : SeriesSequence
  seriesB : SeriesSequence
  dominates : Prop

def comparisonTestCondition (a b : SeriesSequence) : Prop := ∀ n : ℕ, 0 ≤ a.terms n ∧ a.terms n ≤ b.terms n

theorem comparison_test_convergence (a b : SeriesSequence) (h : comparisonTestCondition a b) (hb : seriesConverges b) : seriesConverges a := by
  sorry

theorem comparison_test_divergence (a b : SeriesSequence) (h : comparisonTestCondition a b) (ha : ¬ seriesConverges a) : ¬ seriesConverges b := by
  exact mt (comparison_test_convergence a b h) ha

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
