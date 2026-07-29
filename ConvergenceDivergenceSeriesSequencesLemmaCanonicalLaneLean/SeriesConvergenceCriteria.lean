import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.ConvergenceTests

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure IntegralTestPackage (dom : SeriesSequenceDomain) extends ConvergenceTestPackage dom where
  functionRepresentation : (dom.indexSet → dom.termType) → (ℝ → ℝ)
  integralConverges : ∀ (terms : dom.indexSet → dom.termType), testCondition terms ↔ (∫ (1 : ℝ) to ∞, functionRepresentation terms x dx) < ∞

structure AlternatingSeriesTestPackage (dom : SeriesSequenceDomain) extends ConvergenceTestPackage dom where
  alternatingSign : (dom.indexSet → dom.termType) → Prop
  decreasingMagnitude : ∀ (terms : dom.indexSet → dom.termType), alternatingSign terms → (∀ n, dom.norm (terms (n+1)) ≤ dom.norm (terms n))
  limitZero : ∀ (terms : dom.indexSet → dom.termType), alternatingSign terms → (Limit (λ n : dom.indexSet => dom.norm (terms n)) = 0)

structure PowerSeriesPackage (dom : SeriesSequenceDomain) where
  coefficients : ℕ → ℝ
  radiusOfConvergence : ℝ
  insideRadiusConverges : ∀ (x : ℝ), |x| < radiusOfConvergence → seriesSummation dom (λ n : ℕ => coefficients n * x^n) 0 < ∞
  outsideRadiusDiverges : ∀ (x : ℝ), |x| > radiusOfConvergence → ∀ N, ∃ n ≥ N, seriesSummation dom (λ n : ℕ => coefficients n * x^n) n = ∞

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse