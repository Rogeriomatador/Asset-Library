-- AttachPropToR6.lua(u): prende UM modelo ao Right Arm do personagem R6.
-- Execute no servidor para replicação. Testar a orientação com o modelo real.
local Prop = {}
local DEFAULT_OFFSET = CFrame.new(0, -0.52, -0.75) * CFrame.Angles(math.rad(-90), 0, 0)

local function getArm(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    assert(humanoid and humanoid.RigType == Enum.HumanoidRigType.R6, "Esperado personagem R6")
    local arm = character:FindFirstChild("Right Arm")
    assert(arm and arm:IsA("BasePart"), "Right Arm ausente")
    return arm
end

function Prop.Attach(character, template, options)
    assert(character and character:IsA("Model"), "Personagem precisa ser Model")
    assert(template and template:IsA("Model"), "O item original precisa ser Model")
    options = options or {}
    local arm = getArm(character)
    local attachmentName = options.Name or "HeldProp"
    local previous = character:FindFirstChild(attachmentName)
    if previous then previous:Destroy() end

    local item = template:Clone()
    item.Name = attachmentName
    local grip = item:FindFirstChild("GripPart", true)
    assert(grip and grip:IsA("BasePart"), "Template sem BasePart chamada GripPart")
    item.Parent = character

    for _, part in item:GetDescendants() do
        if part:IsA("BasePart") then
            part.Anchored = false
            part.CanCollide = false
            part.CanTouch = false
            part.Massless = true
            if part ~= grip then
                -- Mantém a geometria original ao ligar cada parte ao GripPart.
                local rigid = Instance.new("WeldConstraint")
                rigid.Name = "R6PropRigid"
                rigid.Part0 = grip
                rigid.Part1 = part
                rigid.Parent = grip
            end
        end
    end

    local offset = options.C0 or DEFAULT_OFFSET
    grip.CFrame = arm.CFrame * offset
    local motor = Instance.new("Motor6D")
    motor.Name = "R6HandGrip"
    motor.Part0 = arm
    motor.Part1 = grip
    motor.C0 = offset
    motor.C1 = CFrame.identity
    motor.Parent = arm
    -- O objeto acompanha a rotação e a posição do braço R6.
    -- Não ancorar GripPart. Ajustar C0 até a alça ficar no lado certo.
    return item, motor
end

function Prop.Detach(character, name)
    local item = character:FindFirstChild(name or "HeldProp")
    if item then item:Destroy() end
    local arm = character:FindFirstChild("Right Arm")
    if arm then
        local motor = arm:FindFirstChild("R6HandGrip")
        if motor then motor:Destroy() end
    end
end

return table.freeze(Prop)
