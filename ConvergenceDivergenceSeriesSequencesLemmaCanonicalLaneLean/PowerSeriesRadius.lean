import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean

structure PowerSeriesRadiusPackage where
  radiusDefinition : Prop
  rootFormula : Prop
  ratioFormula : Prop
  endpointBehavior : Prop
  analyticContinuation : Prop

structure PowerSeriesRadiusEvidence (P : PowerSeriesRadiusPackage) where
  radiusDefinitionClosed : P.radiusDefinition
  rootFormulaClosed : P.rootFormula
  ratioFormulaClosed : P.ratioFormula
  endpointBehaviorClosed : P.endpointBehavior
  analyticContinuationClosed : P.analyticContinuation

def PowerSeriesRadiusClosed (P : PowerSeriesRadiusPackage) : Prop :=
  P.radiusDefinition ∧ P.rootFormula ∧ P.ratioFormula ∧
  P.endpointBehavior ∧ P.analyticContinuation

theorem power_series_radius_closed_from_evidence (P : PowerSeriesRadiusPackage)
    (E : PowerSeriesRadiusEvidence P) : PowerSeriesRadiusClosed P := by
  exact And.intro E.radiusDefinitionClosed
    (And.intro E.rootFormulaClosed
      (And.intro E.ratioFormulaClosed
        (And.intro E.endpointBehaviorClosed E.analyticContinuationClosed)))

end ConvergenceDivergenceSeriesSequencesLemmaCanonicalLaneLean
end HautevilleHouse