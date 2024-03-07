import { useBackend } from '../backend';
import { Button, Input, LabeledList, Section, Flex, Stack } from '../components';
import { Window } from '../layouts';

export const MobCreator = (props, context) => {
  const { act, data } = useBackend(context);
  const [mobType, setMobType] = useSharedState(context, 'mobType', '');
  const [mobName, setMobName] = useSharedState(context, 'mobName', '');
  const [mobHP, setMobHP] = useSharedState(context, 'mobHP', 100);
  const [mobX, setMobX] = useSharedState(context, 'mobX', 0);
  const [mobY, setMobY] = useSharedState(context, 'mobY', 0);
  const [mobZ, setMobZ] = useSharedState(context, 'mobZ', 0);

  const createMob = () => {
    act('create_mob', {
      mobType,
      mobName,
      mobHP,
      mobX,
      mobY,
      mobZ,
    });
  };

  return (
    <Window title="Mob Creator" width={1000} height={700} theme="admin">
      <Window.Content>
        <Section title="Mob Basic Info">
          <Stack mx="10px">
            <Flex direction="column">
              <Flex.Item>
                <Input
                  placeholder="Mob Type"
                  value={mobType}
                  onChange={(e, value) => setMobType(value)}
                  style={{ display: 'inline-block' }}
                />
              </Flex.Item>
              <Flex.Item>
                <Input
                  placeholder="Mob Name"
                  value={mobName}
                  onChange={(e, value) => setMobName(value)}
                  style={{ display: 'inline-block' }}
                />
              </Flex.Item>
              <Flex.Item>
                <Input
                  placeholder="Mob HP"
                  value={mobHP}
                  onInput={(e, value) => setMobHP(value)}
                  style={{ display: 'inline-block' }}
                />
              </Flex.Item>
              <Flex.Item>
                <Input
                  placeholder="X"
                  value={mobX}
                  onInput={(e, value) => setMobX(value)}
                  style={{ display: 'inline-block' }}
                />
                <Input
                  placeholder="Y"
                  value={mobY}
                  onInput={(e, value) => setMobY(value)}
                  style={{ display: 'inline-block' }}
                />
                <Input
                  placeholder="Z"
                  value={mobZ}
                  onInput={(e, value) => setMobZ(value)}
                  style={{ display: 'inline-block' }}
                />
              </Flex.Item>
            </Flex>
          </Stack>
          <Button onClick={createMob}>Create Mob</Button>
        </Section>
      </Window.Content>
    </Window>
  );
};
