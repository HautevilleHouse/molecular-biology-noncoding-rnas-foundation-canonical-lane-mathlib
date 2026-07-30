import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure FunctionalAnnotationConstruction where
  sequenceConservation : Prop
  secondaryStructurePredicted : Prop
  bindingPartnersIdentified : Prop
  cellularLocalization : Prop
  knockoutPhenotype : Prop
  sequenceConservationTerm : sequenceConservation
  secondaryStructurePredictedTerm : secondaryStructurePredicted
  bindingPartnersIdentifiedTerm : bindingPartnersIdentified
  cellularLocalizationTerm : cellularLocalization
  knockoutPhenotypeTerm : knockoutPhenotype
  functionalAnnotationFromConstruction :
    sequenceConservation → secondaryStructurePredicted → bindingPartnersIdentified →
    cellularLocalization → knockoutPhenotype → Prop

def FunctionalAnnotationConstruction.toFoundational (C : FunctionalAnnotationConstruction) : Prop :=
  C.functionalAnnotationFromConstruction C.sequenceConservationTerm C.secondaryStructurePredictedTerm
    C.bindingPartnersIdentifiedTerm C.cellularLocalizationTerm C.knockoutPhenotypeTerm

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse
