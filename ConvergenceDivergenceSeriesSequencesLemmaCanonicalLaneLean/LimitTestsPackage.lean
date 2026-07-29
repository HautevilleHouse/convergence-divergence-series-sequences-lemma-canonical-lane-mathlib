import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean.ConvergenceCriteriaPackage

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure LimitTestsPackage {C : ConvergenceCriteriaPackage} where
  limitUniqueness : Prop
  limitAlgebra : Prop
  squeezeTheorem : Prop
  limitUniquenessProof : limitUniqueness
  limitAlgebraProof : limitAlgebra
  squeezeTheoremProof : squeezeTheorem

structure LimitTestsEvidence {C : ConvergenceCriteriaPackage}
    (L : LimitTestsPackage C) where
  limitUniquenessClosed : L.limitUniqueness
  limitAlgebraClosed : L.limitAlgebra
  squeezeTheoremClosed : L.squeezeTheorem

def LimitTestsClosed {C : ConvergenceCriteriaPackage}
    (L : LimitTestsPackage C) : Prop :=
  L.limitUniqueness ∧ L.limitAlgebra ∧ L.squeezeTheorem

theorem limit_tests_closed_from_evidence {C : ConvergenceCriteriaPackage}
    (L : LimitTestsPackage C) (E : LimitTestsEvidence L) :
    LimitTestsClosed L := by
  exact And.intro E.limitUniquenessClosed
    (And.intro E.limitAlgebraClosed E.squeezeTheoremClosed)

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse