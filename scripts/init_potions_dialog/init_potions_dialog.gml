// load dialog for npc0

#macro DIALOG_POTION_SELLER 0
dialog_add_string(DIALOG_POTION_SELLER, "Hello traveller.\nWhat can I do for you?", prtr_fem);
dialog_add_branch(DIALOG_POTION_SELLER, 0, npc0_potion_requested, "Potion-seller, I want you to give me your strongest potion!");
dialog_add_branch(DIALOG_POTION_SELLER, 1, DO_NOTHING, "Nothing.");

#macro DIALOG_POTION_SELLER_2 1
dialog_add_string(DIALOG_POTION_SELLER_2, "My potions are much too strong for you, traveller; they would surely kill you!");
