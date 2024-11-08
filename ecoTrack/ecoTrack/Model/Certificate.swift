//
//  Certificate.swift
//  ecoTrack
//
//  Created by Diego Ferreira Santos on 08/11/24.
//


enum Certificate: String, CaseIterable {
    case iso = "ISO 1401 "
    case seloverde = "Selo Verde"
    
    var description: String {
        switch self {
        case .iso:
            return "Gestão ambielntal eficaz para empresas sustentáveis"
        case .seloverde: return "Reconhecimento por práticas empresariais sustentáveis"
        }
    }
    var goals: [String] {
        switch self {
        case .iso:
            return ["Identifique áreas de impacto ambiental.",
                    "Estabeleça metas de economia de água, energia e materiais.",
                    "Crie práticas para minimizar e reciclar resíduos.",
                    "Realize treinamentos em práticas sustentáveis e compliance.",
                    "Monitore o impacto ambiental com métricas específicas.",
                    "Defina e implemente ações para alcançar melhorias.",
                    "Avalie regularmente o progresso e ajuste práticas."]
        case .seloverde:
            return ["Desenvolver uma estratégia de certificação de produtos e serviços com ciclo de vida sustentável.",
                    "Promover práticas de sustentabilidade e competitividade no mercado.",
                    "Garantir que produtos atendam aos critérios de acesso ao mercado internacional.",
                    "Estimular a adoção de práticas ASG em todos os setores da empresa.",
                    "Definir diretrizes sustentáveis em conjunto com o Comitê Gestor.",
                    "Estabelecer requisitos mínimos de sustentabilidade com base em normas técnicas.",
                    "Acreditar certificadoras para garantir a conformidade com os padrões ambientais."]
        }
    }
    
    var link: String {
        switch self {
        case .iso:
            return "https://certificacaoiso.com.br/iso-14001-2/"
        case .seloverde:
            return "https://sebrae.com.br/sites/PortalSebrae/artigos/voce-sabe-o-que-e-selo-verde,a031949fca8e4810VgnVCM100000d701210aRCRD#:~:text=O%20selo%20verde%20é%20uma,como%20certificação%20verde%20ou%20ecosselo."
        }
    }
    
    var whatIs: String {
        switch self {
        case .iso:
            return "A ISO 14004 é uma norma internacional que fornece diretrizes para implementar e manter um sistema de gestão ambiental eficaz. Complementar à ISO 14001, ela oferece orientações práticas para empresas de todos os portes, visando minimizar impactos ambientais, cumprir regulamentações e promover a sustentabilidade. A ISO 14004 aborda planejamento, controle operacional, auditoria e melhorias contínuas, ajudando organizações a gerenciar recursos de forma mais responsável e a reduzir riscos ambientais. A certificação contribui para a imagem pública da empresa, além de reduzir custos e aumentar a eficiência operacional."
        case .seloverde:
            return "O Programa Selo Verde Brasil é uma iniciativa do governo federal para certificar produtos e serviços nacionais com ciclos de vida socioambientalmente responsáveis, promovendo sustentabilidade, competitividade de mercado e acesso ao mercado internacional. Aberto aos setores primário, secundário e terciário, o programa incentiva práticas ASG e conta com um Comitê Gestor para definir diretrizes sustentáveis. Normas técnicas, desenvolvidas com a ABNT e participação do setor privado, estabelecem os requisitos mínimos de sustentabilidade, e as certificadoras são acreditadas pelo INMETRO."
        }
    }
    
    var benefits: [String] {
        switch self {
        case .iso:
            return ["Melhora a eficiência no uso de recursos e diminui desperdícios.","Facilita o cumprimento de regulamentações ambientais.","Fortalece a reputação sustentável perante clientes e parceiros.", "Pode abrir portas em mercados que valorizam práticas sustentáveis.","Incentiva a participação dos funcionários na sustentabilidade.","Promove práticas de melhoria constante em processos ambientais."]
        case .seloverde:
            return ["Fortalece a imagem da empresa como sustentável e responsável.",
                    "Aumenta a competitividade no mercado nacional e internacional.",
                    "Facilita o acesso a mercados que valorizam práticas ambientais.",
                    "Promove a redução de custos com práticas de eficiência e sustentabilidade.",
                    "Aumenta o engajamento de clientes e parceiros em práticas socioambientais.",
                    "Reduz riscos de penalidades ambientais ao garantir conformidade."]
        }
    }
    
    
}
