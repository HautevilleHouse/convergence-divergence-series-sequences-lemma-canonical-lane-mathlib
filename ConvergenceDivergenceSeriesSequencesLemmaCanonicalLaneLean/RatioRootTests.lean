import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.SeriesSequenceDefinitions

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure RatioTestPackage where
  series : SeriesSequence
  limitRatio : ℝ
  condition : Filter.Tendsto (λ n : ℕ => |series.terms (n+1)| / |series.terms n|) Filter.atTop (𝓝 limitRatio)
  testResult : seriesConverges series ∨ ¬ seriesConverges series

def ratioTestConverges (s : SeriesSequence) : Prop :=
  ∃ L : ℝ, L < 1 ∧ Filter.Tendsto (λ n : ℕ => |s.terms (n+1)| / |s.terms n|) Filter.atTop (𝓝 L)

def ratioTestDiverges (s : SeriesSequence) : Prop :=
  ∃ L : ℝ, L > 1 ∧ Filter.Tendsto (λ n : ℕ => |s.terms (n+1)| / |s.terms n|) Filter.atTop (𝓝 L)

theorem ratio_test_implies_convergence (s : SeriesSequence) (h : ratioTestConverges s) : seriesConverges s := by
  sorry

theorem ratio_test_implies_divergence (s : SeriesSequence) (h : ratioTestDiverges s) : ¬ seriesConverges s := by
  sorry

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
