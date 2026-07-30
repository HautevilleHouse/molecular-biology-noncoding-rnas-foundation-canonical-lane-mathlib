import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean

structure DiseaseAssociationPackage where
  cancerAssociated : Prop
  neurologicalDisorders : Prop
  cardiovascularDiseases : Prop
  otherDiseases : Prop
  biomarkerPotential : Prop

structure DiseaseAssociationEvidence (D : DiseaseAssociationPackage) where
  cancerAssociatedClosed : D.cancerAssociated
  neurologicalDisordersClosed : D.neurologicalDisorders
  cardiovascularDiseasesClosed : D.cardiovascularDiseases
  otherDiseasesClosed : D.otherDiseases
  biomarkerPotentialClosed : D.biomarkerPotential

def DiseaseAssociationClosed (D : DiseaseAssociationPackage) : Prop :=
  D.cancerAssociated ∧ D.neurologicalDisorders ∧ D.cardiovascularDiseases ∧
  D.otherDiseases ∧ D.biomarkerPotential

theorem disease_association_closed_from_evidence
    (D : DiseaseAssociationPackage) (Ev : DiseaseAssociationEvidence D) :
    DiseaseAssociationClosed D := by
  exact And.intro Ev.cancerAssociatedClosed
    (And.intro Ev.neurologicalDisordersClosed
      (And.intro Ev.cardiovascularDiseasesClosed
        (And.intro Ev.otherDiseasesClosed Ev.biomarkerPotentialClosed)))

end MolecularBiologyNoncodingRnasFoundationCanonicalLaneLean
end HautevilleHouse