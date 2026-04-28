using System.Diagnostics;

abstract class Character
{
    protected Character(string characterType)
    {
        this.characterType = characterType;
    }

    public abstract int DamagePoints(Character target);

    public virtual bool Vulnerable()
    {
        return false;
    }

    public override string ToString()
    {
        return "Character is a " + characterType;
    }

    string characterType;
}

class Warrior : Character
{
    public Warrior() : base("Warrior")
    {
    }

    public override int DamagePoints(Character target)
    {
        if (target.Vulnerable())
        {
            return 10;
        }
        else
        {
            return 6;
        }
    }
}

class Wizard : Character
{
    public Wizard() : base("Wizard")
    {}

    public override int DamagePoints(Character target)
    {
        if (spellPrepared)
        {
            return 12;
        }
        else
        {
            return 3;
        }
    }

    public override bool Vulnerable()
    {
        if (!spellPrepared)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public void PrepareSpell()
    {
        spellPrepared = true;
    }

    bool spellPrepared;
}
