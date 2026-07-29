import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure SequenceSpace where
  pointType : Type u
  distance : pointType → pointType → ℝ
  metricAxioms : ∀ x y z : pointType, distance x y = 0 ↔ x = y ∧ distance x y = distance y x ∧ distance x z ≤ distance x y + distance y z

def limitPoint (space : SequenceSpace) (seq : ℕ → space.pointType) (L : space.pointType) : Prop :=
  ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, space.distance (seq n) L < ε

structure LimitExistencePackage (space : SequenceSpace) where
  cauchyCriterion : (ℕ → space.pointType) → Prop
  cauchyImpliesConvergent : ∀ (seq : ℕ → space.pointType), cauchyCriterion seq → ∃ (L : space.pointType), limitPoint space seq L
  limitUniqueness : ∀ (seq : ℕ → space.pointType) (L1 L2 : space.pointType), limitPoint space seq L1 → limitPoint space seq L2 → L1 = L2

structure MonotoneSequencePackage (space : SequenceSpace) [OrderedSet space.pointType] where
  boundedMonotoneConverges : ∀ (seq : ℕ → space.pointType), (∀ n, seq n ≤ seq (n+1)) → (∃ M, ∀ n, seq n ≤ M) → ∃ L, limitPoint space seq L

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse