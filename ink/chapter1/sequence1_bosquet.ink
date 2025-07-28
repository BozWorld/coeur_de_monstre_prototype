// Dans sequence1_bosquet.ink
// Séquence 1 : Réveil dans le bosquet - Type: Exploration - Instinct dominant: Intuition
->sequence1_start
=== sequence1_start ===
VAR successes_count = 0
VAR actions_taken = 0
VAR found_berries = false
VAR found_animal_traces = false
VAR found_church_traces = false
VAR analyzed_environment = false

Tu te réveilles dans une clairière brumeuse. Tes sens sont encore engourdis, mais quelque chose en toi pulse d'une énergie nouvelle. L'air est épais, chargé d'une humidité qui colle à ta peau... ou ce qui en tient lieu désormais.

Que fais-tu ?

+ [Observer l'environnement] -> observer_environnement_basic
+ [Fouiller le sol] -> fouiller_sol
* {successes_count >= 3} [Observer les détails] -> observer_details
* {successes_count >= 3} [Fouiller les arbres] -> fouiller_arbres  
* {successes_count >= 3} [Analyser les traces] -> analyser_traces
* {successes_count >= 5} [Pressentir le danger] -> pressentir_danger
+ [Terminer l'exploration] -> sequence1_end

=== observer_environnement_basic ===
Tu balayés du regard cette clairière où tu as... émergé ? Le sol est jonché de feuilles mortes et de mousse humide. Des arbres anciens t'entourent, leurs branches entrelacées formant une voûte naturelle qui filtre la lumière du jour.

~ actions_taken++
# action_type: exploration
# instinct_required: intuition
# tier_required: 1
# dice_test: true

{dice_success:
    ~ successes_count++
    Tes nouveaux sens captent plus que tu ne l'aurais cru possible. L'orientation devient claire : au nord, la forêt s'épaissit. À l'est, tu distingues une structure artificielle dans le lointain.
    # consequences: +orientation_basic
    - else:
    La brume trouble ta vision. Tout semble flou, indistinct. Tu as du mal à t'orienter dans cet environnement.
}

-> sequence1_start

=== fouiller_sol ===
Tes mains... non, tes griffes maintenant, fouillent parmi les feuilles mortes et la terre humide.

~ actions_taken++
# action_type: exploration
# instinct_required: intuition
# tier_required: 1
# dice_test: true

{dice_success:
    ~ successes_count++
    ~ found_berries = true
    Tu découvres des baies sauvages, encore fraîches. Leur goût sucré réveille tes papilles et te redonne un peu d'énergie.
    # consequences: +berries_found, +1_pv
    - else:
    Tes fouilles ne révèlent que de la terre et des racines. Rien d'utile.
}

-> sequence1_start

=== observer_details ===
{successes_count < 3: Tes sens ne sont pas encore assez aiguisés pour cette observation détaillée. -> sequence1_start}

Tes sens aiguisés remarquent des détails qui t'avaient échappé. Là, dans la mousse : de petites empreintes, des marques de pattes. Un animal de taille modeste est passé par ici récemment.

~ actions_taken++
~ found_animal_traces = true
# action_type: exploration
# instinct_required: intuition
# tier_required: 2
# consequences: +animal_traces, unlock_sequence2
# dice_test: true

{dice_success:
    ~ successes_count++
    Les traces sont fraîches, très fraîches. L'animal n'est sûrement pas loin. Tu peux même distinguer qu'il s'agit d'un petit primate à la démarche particulière.
    - else:
    Les traces restent difficiles à interpréter, mais tu sais qu'un animal est dans les parages.
}

-> sequence1_start

=== fouiller_arbres ===
{successes_count < 3: Tu n'as pas encore développé assez d'intuition pour explorer les arbres efficacement. -> sequence1_start}

Les branches révèlent des secrets : des écorces griffées, des branches cassées selon un motif particulier. Quelqu'un ou quelque chose a marqué un chemin vers l'est.

~ actions_taken++
~ found_church_traces = true
# action_type: exploration
# instinct_required: intuition
# tier_required: 2
# consequences: +church_path, unlock_sequence3
# dice_test: true

{dice_success:
    ~ successes_count++
    Le chemin est clairement tracé. Ces marques sont anciennes mais délibérées, menant vers ce qui semble être une structure en pierre au loin.
    - else:
    Les marques existent, mais leur signification reste obscure.
}

-> sequence1_start

=== analyser_traces ===
{successes_count < 3: Ton niveau d'éveil n'est pas suffisant pour une analyse approfondie. -> sequence1_start}

Ces marques suggèrent une géographie complexe de ce territoire. Tu comprends les flux, les passages, les lieux de refuge et les zones dangereuses.

~ actions_taken++
~ analyzed_environment = true
# action_type: exploration
# instinct_required: intuition
# tier_required: 2
# consequences: +geographic_knowledge, +bonus_sequence4
# dice_test: true

{dice_success:
    ~ successes_count++
    Ta compréhension du terrain te donnera un avantage tactique dans les rencontres futures.
    - else:
    Tu saisis quelques éléments, mais la vision d'ensemble t'échappe encore.
}

-> sequence1_start

=== pressentir_danger ===
{successes_count < 5: Tes capacités ne sont pas encore assez développées pour pressentir l'avenir. -> sequence1_start}

Une tension invisible flotte dans l'air. Tes instincts les plus profonds se mettent en alerte. Une vision fulgurante traverse ton esprit : un homme en armure cabossée, le regard hanté, qui marche vers cette clairière. Il sera là bientôt.

~ actions_taken++
# action_type: exploration
# instinct_required: intuition
# tier_required: 3
# consequences: +vision_algor, +advantage_sequence4
# crisis_risk: transcendance
# dice_test: true

{dice_success:
    ~ successes_count++
    La vision est claire et précise. Tu sais exactement quand et comment il arrivera. Cet avantage pourrait être décisif.
    # consequences: +perfect_foresight
    - else:
    La vision reste floue, mais l'avertissement est là.
}

{successes_count >= 6:
    Une puissance écrasante menace de t'envahir. Tu sens que tu pourrais perdre le contrôle de tes nouveaux pouvoirs.
    # trigger_crisis: transcendance
}

-> sequence1_start

=== sequence1_end ===
{successes_count == 0:
    Désorientée et confuse, tu n'arrives pas à comprendre ce nouvel environnement. Une crise d'incompétence te submerge.
    # trigger_crisis: incompetence
    # crisis_type: retrouver_sens
    
- else:

    {actions_taken} actions entreprises, {successes_count} succès obtenus.
    
    {successes_count >= 5:
        Tu as atteint un niveau de compréhension transcendé de ton environnement.
        # player_tier: transcended
    - else:
        {successes_count >= 3:
            Tes sens éveillés te permettent une compréhension approfondie.
            # player_tier: awakened
        - else:
            Tu as acquis les bases pour survivre dans ce nouvel environnement.
            # player_tier: primitive
        }
    }
    
    {found_animal_traces:
        Les traces d'animal que tu as découvertes ouvrent une nouvelle possibilité d'exploration.
        # unlock_sequence: animal_encounter
    }
    
    {found_church_traces:
        Le chemin vers la structure ancienne s'offre à toi.
        # unlock_sequence: church_exploration
    }
    
    {analyzed_environment:
        Ta compréhension du terrain te sera utile dans les épreuves à venir.
        # add_bonus: geographic_knowledge
    }
}

# sequence_completed: sequence1
# successes_total: {successes_count}
# actions_total: {actions_taken}

-> END

=== dice_success ===
// Cette fonction sera appelée par Godot après le jet de dés
// Godot définira cette variable selon le résultat du jet 5d6
VAR dice_result_success = false
{dice_result_success: 
    -> success_result
- else:
    -> failure_result
}

= success_result
-> DONE

= failure_result
-> DONE