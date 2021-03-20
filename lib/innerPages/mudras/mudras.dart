class Mudras {
  final String imageUrl;
  final String name;
  final String title;
  final String benefits;
  final String procedure;
  final String icon;

  Mudras(this.imageUrl, this.name, this.title, this.benefits, this.procedure, this.icon);
}
// description and benefit are together and procedure and time are together
// agni, vayu, prithvi, akash, jal

final _mudra1 = Mudras(
  "assets/mudras/vayumudra.jpg",
  "Vayu Mudra",
  "Gesture of Air",
  "Vayu mudra is a yogic hand gesture believed to help regulate and reduce the air element within the body. The name comes from the Sanskrit, vayu, meaning 'air,' and mudra, meaning 'gesture'. This mudra helps to release the excess air from the body reducing chest pain due to trapped gas",
  "The base of the thumb is then gently pressed into the tip of the finger. The rest of the fingers should all remain straight, and it should be done with both hands simultaneously. Now, Place the hands on the knees with the palms facing up. Relax the hands and arms. For this Mudra to be effective, you need to do it for an average of 45 minutes every day. You can choose to do the Mudra three times for 15 minutes every day, and you can do it anywhere and anytime.",
  "assets/mudras/wind.png"
);

final _mudra2 = Mudras(
  "assets/mudras/varunamudra.jpg",
  "Varuna Mudra",
  "Gesture of water",
  "Varuna mudra is a simple yoga gesture that is designed to balance the water element in the body. It is also known as jal-vardhak mudra, which also comes from the Sanskrit, jal, meaning 'water,' and vardhak, meaning 'enhance.' This mudra can be used to enhance the beauty. It makes your skin glow because it makes the fluids in your body flow and keeps your skin moisturized.",
  "To perform this mudra, the tip of the little finger and the tip of the thumb touch with light pressure, and the other three fingers remain comfortably extended. Now, Place the hands on the knees with the palms facing up. Relax the hands and arms. It is recommended that varuna mudra be practiced three times daily for 15 minutes each time to obtain its health benefits.",
  "assets/mudras/water.png"
);

final _mudra3 = Mudras(
  "assets/mudras/shunyamudra.jpeg",
  "Shunya Mudra",
  "Gesture of sky",
  "Shunya mudra is a simple yoga gesture designed to decrease the space element (akasha) in the body. The name of this mudra comes from the Sanskrit shunya, meaning “emptiness,” “openness” or “spaciousness,” and mudra, meaning 'gesture' or 'seal.' This mudra helps to reduce earaches and also helps people who are going deaf due to age or disease. It also helps in overcoming travel sickness and vertigo related issues.",
  "In this mudra, the tip of the middle finger is placed at the base of the thumb, and the thumb presses gently on the middle finger just below the knuckle. The remaining three fingers stretch comfortably to the sky. Now, Place the hands on the knees with the palms facing up. Relax the hands and arms. To achieve great results, ensure that you practice Shunya Mudra three times a day, for 15 minutes.",
  "assets/mudras/sky.png"
);

final _mudra4 = Mudras(
  "assets/mudras/prithvimudra.jpg",
  "Prithvi Mudra",
  "Gesture of the Earth",
  "Prithvi mudra is a symbolic hand gesture or ‘seal’ used in yoga and Ayurveda to promote healing and spiritual balance within the body. prithvi mudra can be used to balance this element, which resides primarily within tissues, such as skin, hair and bones. This mudra improves the blood circulation throughout your body. It increases patience, tolerance and concentration while meditating. Moreover, it also helps to strengthen weak and lean bones. Surprisingly it helps to increase body weight, reduces weakness and dullness of mind.",
  "To practice prithvi mudra, the tips of the ring fingers should be pressed to the tips of the thumbs on each hand, whilst extending the other fingers straight. This mudra can be practiced in any comfortable and stable seated meditation posture, such as padmasana (Lotus Pose) or sukhasana (Easy Pose), ideally for at least 30 to 45 minutes a day.",
  "assets/mudras/earth.png"
);

final _mudra5 = Mudras(
  "assets/mudras/agnishakti.png",
  "Agni Mudra",
  "Gesture of Fire",
  "Sanskrit for \"fire energy seal\" Agni Shakti Mudra is a hand gesture that can be practiced during meditation in order to stimulate, maintain or contain fire energy within. This mudra helps to reduce the extra fat around your belly, boosts metabolism and controls obesity. It also helps to improve digestion and body strength",
  "This mudra can be practiced in any seated meditation posture, by following these three steps: 1. Touch all four fingers of both hands to the palms. 2. Join the tips of the thumbs together 3. Turn the knuckles to face away from the body",
  "assets/mudras/fire.png"
);

final fiveMudras = [_mudra1, _mudra2, _mudra3, _mudra4, _mudra5];

// all other left over mudras
final _mudra6 = Mudras(
  "assets/mudras/gyanmudra.jpg",
  "Gyan Mudra",
  "Gesture of Knowledge",
  "Gyan mudra, otherwise known as chin mudra, is a sacred hand gesture or ‘seal’ used to direct energy and maintain focus. Gyan is Sanskrit for ‘knowledge’ or ‘wisdom,’ and so this gesture is sometimes referred to as the Mudra of Knowledge. This is one of the most basic yoga mudras which help to improve your concentration and knowledge.",
  "To perform this mudra, bring the tip of the thumb and index finger together on both hands, forming a circle. Keep the remaining three fingers outstretched with the palm facing upward. This pose can be performed better early in the morning for a duration of 35 to 40 minutes.",
  ""
);

final _mudra7 = Mudras(
  "assets/mudras/dhyanmudra.jpg",
  "Dhyana Mudra",
  "Gesture of Meditation",
  "Dhyana mudra is a sacred hand gesture or ‘seal,’ used during yoga and meditation practice as a means of channeling the flow of vital life force energy known as prana. This mudra helps to relax your mind and release the stress, anxiety and depression. It also helps to move you towards the enlightenment.",
  "Keep both your hands resting on your legs while keeping the right hand over the left. The palms should be facing upwards and fingers extended. For maximum benefits, this mudra should be practiced daily during meditation for at least 30 minutes.",
  ""
);

final _mudra8 = Mudras(
  "assets/mudras/pranamudra.jpg",
  "Prana Mudra",
  "Gesture of life",
  "Prana mudra is a sacred hand gesture or ‘seal,’ used during yoga and meditation practice as a means of channeling the flow of vital life force energy known as prana. This mudra improves your immune system. This improves eye power and sharpness of your vision. It also cures eye diseases and reduces tiredness.",
  "Bend your ring finger and little finger and touch the tip of both these fingers with the tip of your thumb. Straighten the other two fingers of each hand so that they are relaxed and slightly apart. Now, Place the hands on the knees with the palms facing up. Relax the hands and arms.  Prana mudra is usually practiced on both hands, and should be held for 30 to 45 minutes for maximum benefits. This can be done all at once, or broken up into three shorter practices of 10 to 15 minutes.",
  ""
);

final _mudra9 = Mudras(
  "assets/mudras/chinmayamudra.jpg",
  "Chinmaya Mudra",
  "Gesture of awareness",
  "Chinmaya is a Sanskirt word which means \"supreme awareness\", \"full of knowledge\" or \"pure wisdom\"; and mudra means \"gesture\" or \"seal\". This mudra improves the flow of energy in the body and stimulates digestion.",
  "To practice chinmaya mudra, assume padmasana, vajrasana or sukhasana. Bring the tips of the thumb and forefinger together and form a circle. Curl the remaining fingers into your palms. Place your palms on the upper thighs. The palms can face upward or downward. Keep the eyes closed and breathe through the nose. Start practicing the mudra for 10 minutes and gradually increase the duration for up to 45 minutes.",
  ""
);

final _mudra10 = Mudras(
  "assets/mudras/apanamudra.jpg",
  "Apana Mudra",
  "Gesture of digestion",
  "Apana mudra is a sacred hand gesture or ‘seal,’ used during yoga and meditation practice as a means of channeling the flow of vital life force energy known as prana. Also referred to as the 'purification mudra', This mudra helps to purify your body and get rid of unwanted toxins. It also helps to deal with constipation and useful during childbirth in case there is a delay in childbirth.",
  "Bend the middle and ring finger and touch the tip of both these fingers with the tip of your thumb. Your index and little finger should be pointing straight. Straighten the other two fingers of each hand so that they are relaxed and slightly apart. Now, Place the hands on the knees with the palms facing up. Relax the hands and arms. Apana mudra is usually practiced on both hands, and should be held for 30 to 45 minutes for maximum benefits. This can be done all at once, or broken up into three shorter practices of 10 to 15 minutes.",
  ""
);

final featuredMudras = [_mudra6, _mudra7, _mudra8, _mudra9, _mudra10];
