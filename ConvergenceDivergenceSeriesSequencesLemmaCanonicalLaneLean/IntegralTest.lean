import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.SeriesSequenceDefinitions

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure IntegralTestPackage where
  series : SeriesSequence
  f : ℝ → ℝ
  fNonnegative : ∀ x ≥ 1, f x ≥ 0
  fDecreasing : ∀ x y, 1 ≤ x → x ≤ y → f y ≤ f x
  fIntegrableOn : ∀ (a : ℝ), a ≥ 1 → IntervalIntegrable f volume 1 a
  fTerms : ∀ n : ℕ, 1 ≤ (n : ℝ) + 1 → series.terms n = f (n : ℝ)

def integralTestCondition (s : SeriesSequence) (f : ℝ → ℝ) : Prop :=
  (∀ n : ℕ, s.terms n = f (n : ℝ)) ∧ (∀ x ≥ 1, f x ≥ 0) ∧ (∀ x y, 1 ≤ x → x ≤ y → f y ≤ f x) ∧
  (∀ (a : ℝ), a ≥ 1 → IntervalIntegrable f volume 1 a)

theorem integral_test_convergence (s : SeriesSequence) (f : ℝ → ℝ) (h : integralTestCondition s f) (hint : HasFiniteIntegral (λ x : ℝ => f x) volume) : seriesConverges s := by
  sorry

theorem integral_test_divergence (s : SeriesSequence) (f : ℝ → ℝ) (h : integralTestCondition s f) (hdiv : ¬ HasFiniteIntegral (λ x : ℝ => f x) volume) : ¬ seriesConverges s := by
  sorry

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse
